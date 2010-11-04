module Dooby
  DOOBY_DIR = '.dooby'
  CURRENT_TODO_LIST_FILE = "#{DOOBY_DIR}/list.yml"
  
  ## STATUSES
  AVAILABLE_STATUSES = [:hold, :doing, :done]
  
  ## SPECIAL CHARS
  SPECIAL_CHAR_COLORS = Hash['@', :blue, '#', :yellow, '%', :white, ':', :magenta]
  SPECIAL_CHARS = SPECIAL_CHAR_COLORS.keys 
  
  ## TAGS
  TODAY_TAG = '#today'
  TOMORROW_TAG = "#tomorrow"
  URGENT_TAG = '#urgent'
  
  SPLITTABLE_TAGS = [TODAY_TAG, URGENT_TAG]
  
  CURRENT_ITEM_TAG = ':doing'
  
  ## DATES
  DATE_FORMAT = '%b/%d/%Y'

  ## TEMPLATES
  TASK_ROW_TEMPLATE = lambda do |task|
    " (#{task.id.red})  #{task.colorize}"
  end
  
end