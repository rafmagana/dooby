$LOAD_PATH.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'dooby'

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