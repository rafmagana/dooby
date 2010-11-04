module Dooby
  
  class List
  
    attr_reader :location

    def initialize(location)
      @location = location
      @tasks = {}
      load!
    end
    
    def flush!
      @tasks = {}
      save!
    end
    
    def add(task = Task.new)
      yield task if block_given?
      task = handle_tomorrow_tag task      
      @tasks[task.id] = task
      save!
    end

    def delete!(task_id)
      if @tasks.delete task_id
        save!
      else
        false
      end
    end
    
    def bulk_delete!(terms)
      only_tags = terms.only_tags *SPECIAL_CHARS
      matches = []
      @tasks.each do |id, task|
        delete! id if only_tags.all? { |tag| task.todo.include? tag }
      end
    end

    def edit!(task_id)
      old_task = @tasks[task_id]
      t = Task.new
      if old_task
        yield t
      end
      delete! task_id
      add t
    end
    
    def tasks?
      !@tasks.empty?
    end
    
    def tasks
      @tasks.dup
    end
    
    def find (what_to_show=[])
      list = []

      if @tasks.empty?
        list = nil
      else
        case what_to_show
        when [] then
          to_delete = []
          to_add = []
          @tasks.each do |id, task|
            today_date = Time.now.strftime(DATE_FORMAT)
            date_tag = "{#{today_date}}"
            if task.todo.include? date_tag
              task_with_today_tag = task.dup
              task_with_today_tag.todo.gsub!(date_tag, "#today")
              to_add << task_with_today_tag
              to_delete << id
            else
              list << TASK_ROW_TEMPLATE.call(task)
            end
          end
          
          to_delete.each { |task_id| delete!(task_id) }
          to_add.each do |task|
            add task
            list << TASK_ROW_TEMPLATE.call(task)
          end
          
        when *SPECIAL_CHARS then
          @tasks.each do |id, task|
            task.todo.gsub(/(#{what_to_show}\w+)/).each do |tag|
              color = SPECIAL_CHAR_COLORS[tag.first_char]
              colorized = tag.send color
              list << colorized unless list.include? colorized
            end
          end
        else
          if what_to_show.any? { |s| s.include? tomorrow }
            what_to_show << tomorrows_date
            what_to_show.delete(tomorrow)
            what_to_show.delete(TOMORROW_TAG)
          end
          @tasks.each do |id, task|
            if what_to_show.all? { |term| task.todo.include? term }
              list << TASK_ROW_TEMPLATE.call(task)
            end
          end
          
          list = nil if list.empty?
        end
      end
            
      list
    end

    def all_tags
      tags = []
      @tasks.each do |id, task|
        tags << task.todo.only_tags(*SPECIAL_CHARS)
      end
      tags.flatten
    end
    
    def current_item
      current = tasks.select do |id, task|
        task.todo.include? CURRENT_ITEM_TAG
      end
      current.flatten.last.todo.gsub(CURRENT_ITEM_TAG,'').strip unless current.blank?
    end
    
    private
    def handle_tomorrow_tag(task)
      if task.todo.include? TOMORROW_TAG
        task.todo.gsub!(/\{[\w\/]+\}/, '')
        task.todo.gsub!(TOMORROW_TAG, "{#{tomorrows_date}}")
        task.todo.gsub!(/#{TOMORROW_TAG}/, '')
      end
      task
    end
    
    def save!
      File.open( @location, 'w' ) do |f|
        f << @tasks.to_yaml
      end
    end
    
    def load!
      begin
        if File.exist? CURRENT_TODO_LIST_FILE
          @tasks = YAML.load_file(@location)
          @tasks = {} unless @tasks
        else
          raise Exceptions::NoYAMLFileFound.new
        end
        
      rescue Exceptions::NoYAMLFileFound
        puts "Todo list file is invalid or do not exist."
      end
    end

    def tomorrow
      TOMORROW_TAG[1..-1]
    end
    
    def tomorrows_date
      Chronic.parse(tomorrow).strftime(DATE_FORMAT)
    end
    
  end
  
end