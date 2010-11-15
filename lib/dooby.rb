$:.unshift(File.dirname(__FILE__)) 

#dependencies
%w[fileutils 
   digest/sha1
   colored
   readline
   highline/import
   chronic].each { |f| require "#{f}" }

#dooby
%w[config
   exceptions
   core_ext
   base
   dates_helper
   list
   status_generator
   task
   cli_helper].each { |f| require "dooby/#{f}" }
   
module Dooby
  def self.init
    unless File.exist? CURRENT_TODO_LIST_FILE
      FileUtils.mkdir DOOBY_DIR
      Base.create_file
      true
    else
      puts "Todo list already exists inside this directory"
      false
    end
  end
  
  def self.trash!
    FileUtils.remove_dir(DOOBY_DIR, force = true)
  end
  
  def self.current_list
    @list ||= List.new CURRENT_TODO_LIST_FILE
  end
  
  def self.cli_helper
    CLIHelper
  end
end
