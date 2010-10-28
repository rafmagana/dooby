module Dooby
  class ReadlineHelper
      attr_accessor :completion_list
      
      def initialize
        @completion_list = ''
        @completion_proc = proc { |s| @completion_list.grep( /^#{Regexp.escape(s)}/ ) }
        
        Readline.completion_append_character = " "
        Readline.completion_proc = @completion_proc
      end
  end
end