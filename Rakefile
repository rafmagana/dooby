# -*- encoding: utf-8 -*-
require 'rubygems'
require 'rake'

require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "dooby"
  gem.summary = %Q{A very simplistic command-line to-do list manager in Ruby}
  gem.description = %Q{Handle your to-do/notes list through the command line}
  gem.email = "raf.magana@gmail.com"
  gem.homepage = "http://github.com/rafmagana/dooby"
  gem.authors = ["Rafael Magaña"]

  gem.add_development_dependency "rspec",    "2.0.0"
  gem.add_development_dependency "cucumber", "0.9.3"
  gem.add_development_dependency "aruba",    "0.2.4"
  gem.add_development_dependency "jeweler",  "1.5.0"
  gem.add_development_dependency "rcov",     "0.9.9"
  gem.add_development_dependency "autotest", "~> 4.3.0"
  
  gem.add_dependency "main",     "4.2.0"
  gem.add_dependency "colored",  "1.2"
  gem.add_dependency "highline", "1.6.1"
  gem.add_dependency "chronic",  "0.3.0"
  gem.add_dependency "fattr",    "2.2.0"
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "dooby #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :bi => [:build, :install]