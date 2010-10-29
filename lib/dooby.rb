$:.unshift(File.dirname(__FILE__)) 

%w[fileutils digest/sha1 colored readline highline/import].each { |f| require "#{f}" }

%w[exceptions
   core_ext
   base
   list
   formatter
   task
   cli_helper].each { |f| require "dooby/#{f}" }
   
module Dooby
  
  DOOBY_DIR = '.dooby'
  CURRENT_TODO_LIST_FILE = "#{DOOBY_DIR}/list.yml"
  
  DEFAULT_STATUS = :hold
  
  AVAILABLE_STATUSES = [:hold, :doing, :done]
  SPECIAL_TAGS = %w[@ # %]
  SPLITTABLE_TAGS = %w[#today #urgent]
  
  TASK_ROW_TEMPLATE = lambda do |task|
    " (#{task.id.red})  #{task.colorize}"
  end
    
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
  
  def self.reload!
    @list = nil
    current_list
  end
  
  def self.cli_helper
    CLIHelper
  end
end