$:.unshift(File.dirname(__FILE__)) 

#dependencies
require 'fileutils'
require 'digest/sha1'

require 'redline'
gem     'colored', '1.2'
require 'colored'
gem     'highline', '1.6.1'
require 'highline/import'
gem     'chronic', '0.3.0'
require 'chronic'


require 'dooby/config'
require 'dooby/exceptions'
require 'dooby/core_ext'
require 'dooby/base'
require 'dooby/dates_helper'
require 'dooby/list'
require 'dooby/status_generator'
require 'dooby/task'
require 'dooby/cli_helper'

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
