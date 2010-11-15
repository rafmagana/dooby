# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:development, :runtime)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "dooby"
  gem.summary = %Q{A very simplistic command-line to-do list manager in Ruby}
  gem.description = %Q{Handle your to-do/notes list through the command line}
  gem.email = "raf.magana@gmail.com"
  gem.homepage = "http://github.com/rafmagana/dooby"
  gem.authors = ["Rafael Magaña"]
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