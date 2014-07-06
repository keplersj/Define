##
##  Original Objective-C Header: DictonaryViewController.h
##  Original Objective-C Implementation: DictonaryViewController.m
##  Original Xcode Project Name: Dictionary
##
##  Initally Ported to Ruby As: define_view_controller.rb
##
##  define_screen.rb
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

class DefineScreen < PM::Screen

  title 'Define'

  def will_load
    #Telling the Engine to Turn On
    AppleReference startUp

    #Allowing the interface to recieve notifactions from the engine
    App.notification_center.observe(name: 'displayDefinition', object: nil, selector: :displayDefinition)
  end

  def on_load
    set_attributes self.view, {
        background_color: '#AAAAAA'.to_color
    }
    @term_text_view = add UITextView.alloc.initWithFrame([[100, 100], [300, 45]], [10.0,10.0])
  end

end