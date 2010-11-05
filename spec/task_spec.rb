require 'spec_helper'

module Dooby
  describe Task do
    
    describe "#new" do
      it "should accept the ToDo text as argument" do
        todo = "this is the todo"
        task = Task.new todo
        task_todo = task.todo
        task_todo.should == todo
      end
      
      it "should set @todo to nil if todo is not passed as argument" do
        task = Task.new
        task.todo.should == nil
      end
    end
    
    describe "#id" do
      it "should return the SHA1 of the @todo" do
        todo = "the todo"
        task = Task.new todo
        task.id.should == Digest::SHA1.hexdigest(todo)[0,6]
      end
    end
    
    describe "An item" do
      it "should be valid if @todo is set to a string" do
        task = Task.new 'todo'
      
        task.valid?.should == true
      end
      
      it "should be invalid if @todo is nil or empty string" do
        Task.new.valid?.should == false
      end
    end
    
    describe "#colorize" do
      it "should return a colorized version of a @todo containing tags without changing @todo" do
        todo = "#context @person %project :status"
        colored_todo = "\e[33m#context\e[0m \e[34m@person\e[0m \e[37m%project\e[0m \e[35m:status\e[0m"
        task = Task.new todo
        task.colorize.should == colored_todo
        task.todo.should == todo
      end
    end
    
  end
end