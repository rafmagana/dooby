module Dooby
  DOOBY_DIR = '.dooby'
  CURRENT_TODO_LIST_FILE = "#{DOOBY_DIR}/list.yml"
  
  AVAILABLE_STATUSES = [:hold, :doing, :done]
  
  SPECIAL_CHAR_COLORS = Hash['@', :blue, '#', :yellow, '%', :white, ':', :magenta]
  SPECIAL_CHARS = SPECIAL_CHAR_COLORS.keys 
  
  SPLITTABLE_TAGS = %w[#today #urgent]
  TOMORROW_TAG = "#tomorrow"
  
  DATE_FORMAT = '%b/%d/%Y'
  
  TASK_ROW_TEMPLATE = lambda do |task|
    " (#{task.id.red})  #{task.colorize}"
  end
  
end