##
##  Original Objective-C Header: DictionaryAppDelagate.h
##  Original Objective-C Implementation: DictonaryAppDelegate.m
##  Original Xcode Project Name: Dictionary
##
##  app_delegate.rb
##  Define
##
##  Currently running under RubyMotion. http://www.rubymotion.com/
##
##  Created by Kepler Sticka-Jones on 8/8/12.
##  Ported to Ruby by Kepler Sticka-Jones on 9/5/14.
##
##  Copyright (c) 2012-2014 Kepler Sticka-Jones. All rights reserved.
##  This code is licensed on MIT. https://raw.githubusercontent.com/k2b6s9j/Define/master/LICENSE
##

class AppDelegate < PM::Delegate

  def on_load(app, options)

    PM.logger.info 'Define has started.'
    startFlurry
    open DefineScreen.new(nav_bar: false)

  end

  def on_open_url(args = {})
    args[:url]        # => the URL used to fire the app (NSURL)
    args[:source_app] # => the bundle ID of the app that is launching your app (string)
    args[:annotation] # => hash with annotation data from the source app

    PM.logger.info "Calling Application Bundle ID: #{:source_app}"
    PM.logger.info "URL scheme: #{:url.scheme}"
    PM.logger.info "URL query: #{:url.query}"

    true
  end

  def startFlurry

    Flurry.startSession('CWNCT873QSVSBRNNVK4H')

  end

end
