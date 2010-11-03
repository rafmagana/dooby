module Dooby
  module StatusGenerator
    private
    def statuses(*args)
      args.each do |s|
        method_name = "#{s.to_s}?".to_sym
        define_method method_name do
          @todo.include? ":#{s.to_s}"
        end
      end
    end
  end
end