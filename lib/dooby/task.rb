module Dooby
  class Task
    include Formateable
    extend StatusGenerator
    
    attr_accessor :todo, :priority, :status
    statuses *AVAILABLE_STATUSES
    
    def initialize
      @todo ||= nil
      @status ||= DEFAULT_STATUS
    end
    
    def id
      @todo ? Digest::SHA1.hexdigest(@todo)[0,6] : nil
    end
    
    def valid?      
      @todo.nil? || @todo == '' ? false : true
    end
        
    def colorize
      colorized_todo = @todo.dup
      
      string_pattern = SPECIAL_CHARS.collect { |c| "(#{c}\\w+)" }
      pattern = Regexp.new(string_pattern.join("|"))
      
      colorized_todo.gsub(pattern).each do |todo|
        color = SPECIAL_CHAR_COLORS[todo.first_char]
        todo.send color
      end
      
    end    
  end
end
