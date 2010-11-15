require 'aruba'

module ArubaExtensions
  def detect_ruby(cmd)
    if cmd =~ /^dooby/
      "ruby -I../../lib -S ../../bin/#{cmd}"
    else
      super(cmd)
    end
  end
end

World(ArubaExtensions)