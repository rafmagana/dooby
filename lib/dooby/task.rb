module Dooby
  class Task
    include Formateable
    
    attr_accessor :todo, :priority, :status
    
    def initialize
      @todo ||= nil
      @status ||= DEFAULT_STATUS
      @priority ||= DEFAULT_PRIORITY
    end
    
    def id
      @todo ? Digest::SHA1.hexdigest(@todo)[0,6] : nil
    end
    
    def valid?      
      @todo.nil? || @todo == '' ? false : true
    end
    
    def doing!
      @status = :doing
    end
    
    def done!
      @status = :done
    end
    
    def hold!
      @status = :hold
    end
    
    def colorize
      colorized_todo = @todo.dup
      
      colorized_todo.gsub(/(#\w+)|(@\w+)|(%\w+)/).each do |todo|
        if todo.include? "@"
          todo.blue
        elsif todo.include? "%"
          todo.white
        else
          todo.yellow
        end
      end
      
    end
    
  end
  
end
