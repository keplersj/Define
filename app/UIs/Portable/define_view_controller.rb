##
##  Original Objective-C Header: DictonaryViewController.h
##  Original Objective-C Implementation: DictonaryViewController.m
##  Original Xcode Project Name: Dictionary
##
##  define_view_controller.rb
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

class DefineViewController < UIViewController

  def viewDidLoad
    #Telling the Engine to Turn On
    AppleReference startUp

    #Allowing the interface to recieve notifactions from the engine
    App.notification_center.observe(name: 'displayDefinition', object: nil, selector: self.displayDefinition)

    #Intialized Everything needed to function and for interface, showing user
    super viewDidLoad

    #Make the damn status bar cooperate!
    self.setNeedsStatusBarAppearanceUpdate

  end

  def viewDidUnload

  end

  def shouldAutorotateToInterfaceOrientation(UIInterfaceOrientation: interfaceOrientation)

  end

  def displayDefinition(NSNotification: notification)

  end

  def KeyboardSwiptDown(id: sender)

  end

  def textFieldShouldReturn(UITextField: textField)

  end

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

end