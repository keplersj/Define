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

class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    NSLog 'Define has started.'
    startFlurry
    createWindow

    true

  end

  def application(application, openURL:url, sourceApplication:sourceApp, annotation:annotation)
    NSLog "Calling Application Bundle ID: #{sourceApplication}"
    NSLog "URL scheme: #{url scheme}"
    NSLog "URL query: #{url query}"

    true
  end

  def startFlurry

    Flurry.startSession('CWNCT873QSVSBRNNVK4H')

  end

  def createWindow

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = DefineViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

  end

end
