# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Define'

  app.pods do
    pod 'FlurrySDK'
  end

  app.development do
    app.phrase do
      app.phrase.enabled = true
      app.phrase.auth_token = 'eeddef8fbe65f23300c674fc23a1d4ee'
    end
  end

end

task :build => 'phrase:pull'
task 'build:device' => 'phrase:pull'
task 'build:simulator' => 'phrase:pull'