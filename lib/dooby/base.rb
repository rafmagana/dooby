require 'yaml'

module Dooby  
  class Base
    def self.create_file
      dooby_file = File.new CURRENT_TODO_LIST_FILE, "w+"
      puts "Created a new todo list inside this directory" if dooby_file
      dooby_file.close
    end    
  end
end