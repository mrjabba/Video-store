#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'

CLEAN.include('test/coverage')

task :default => [:test]

Rake::TestTask.new do |test|
  test.libs << "test"
  test.test_files = Dir["test/test_*.rb"]
end

desc "Prints a sample video store statement."
task :sample do
  ruby 'video_store.rb'
end