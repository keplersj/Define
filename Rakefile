# -*- coding: utf-8 -*-
require 'bundler'

Bundler.setup
Bundler.require :default

task :default => [:android, :ios, :web, :windows_phone]

task :android do
  task = ARGV.last
  Dir.chdir 'android'
  system "rake #{task}"
  task task.to_sym do ; end
end

if Dir.exist? '/Library/RubyMotion/lib'
  import 'ios/Rakefile'

  task 'build:simulator' => 'ios:build:simulator'
end

task :web do
  task = ARGV.last
  Dir.chdir 'web'
  system "rake #{task}"
  task task.to_sym do ; end
end

task :windows_phone do
  task = ARGV.last
  Dir.chdir 'windows-phone'
  system "rake #{task}"
  task task.to_sym do ; end
end