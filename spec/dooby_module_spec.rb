require 'spec_helper'

module Dooby
  describe Dooby do
    describe '#init' do
      it "should create a .dooby dir if it doesn't exists" do
        #expectations
        File.should_receive(:exist?).with(CURRENT_TODO_LIST_FILE)
        FileUtils.should_receive(:mkdir).with(DOOBY_DIR).and_return true
        File.should_receive(:new).with(CURRENT_TODO_LIST_FILE, "w+").and_return mock(File, :close => true)
        
        Dooby.init
      end
      
      it "should return false if .dooby/list.yml exists" do
        File.should_receive(:exist?).and_return true
        Dooby.init.should == false
      end
    end
    
    describe '#trash!' do
      it "should delete the .dooby directory" do
        FileUtils.should_receive(:remove_dir).with(DOOBY_DIR, force = true)
      
        Dooby.trash!
      end
    end
    
    describe '#current_list' do
      it "should return an instance of List class" do
        list = mock(List)
        List.should_receive(:new).with(CURRENT_TODO_LIST_FILE).and_return list
        
        Dooby.current_list.should == list
      end
    end
    
    describe '#reload!' do
      
    end

    describe '#cli_helper' do
      it "should return the CLIHelper class" do
        Dooby.cli_helper.should == CLIHelper
      end
    end
  end
end
