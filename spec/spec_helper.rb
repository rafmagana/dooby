$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'dooby'
require 'rspec'

RSpec.configure do |config|
  
end

def fake_todo_text
  "#context @person %project :status"
end

def fake_tasks
  tasks = {}
  3.times do |t| 
    task = Dooby::Task.new fake_todo_text + t.to_s
    tasks[task.id] = task
  end
  tasks
end

# returns tasks list formated for console
def formatted(tasks)
  if tasks.is_a? Array
    tasks.map {|task| task.to_row}
  else
    tasks.tasks.map {|id,task| task.to_row}
  end
end
