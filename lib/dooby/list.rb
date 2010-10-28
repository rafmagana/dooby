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
    
    def edit!(task_id, new_text)
      old_task = @tasks[task_id]
      delete! task_id
      add do |t|
        t.todo = new_text
        t.priority = old_task.priority
        t.status = old_task.status
      end
    end
    
    def tasks
      @tasks.dup
    end
    
    def list (what_to_show=[])
      list = []
      
      if @tasks.empty?
        list = 'No tasks'
      else
        if what_to_show.empty?
          list << 'Showing all items...'.blue_on_white.bold
          @tasks.each do |id, task|
            list << " (#{id.red})  #{task.colorize}"
          end
        else
          @tasks.each do |id, task|
            if what_to_show.all? { |term| task.todo.include? term }
              list << " (#{id.red})  #{task.colorize}"
            end
          end
          
          if list.empty?
            list.unshift 'No items found containing:'.red_on_white.bold + ' ' + what_to_show.join(' and '.blue)
          else
            list.unshift 'Showing items containing:'.blue_on_white.bold + ' ' + what_to_show.join(' and '.blue)
          end
        end
      end
            
      list
    end

    private
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

  end
  
end