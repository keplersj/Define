##
##  Original Objective-C Header: DictonaryViewController.h
##  Original Objective-C Implementation: DictonaryViewController.m
##  Original Xcode Project Name: Dictionary
##
##  Initially Ported to Ruby As: define_view_controller.rb
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

  title $define_term_field = UITextField.alloc.initWithFrame([[20, 7], [280, 30]])
        $define_term_field.opaque = false
        $define_term_field.borderStyle = UITextBorderStyleRoundedRect
        $define_term_field.clearsOnBeginEditing = true
        $define_term_field.minimumFontSize = '17'
        $define_term_field.clearButtonMode = UITextFieldViewModeAlways
        $define_term_field.keyboardAppearance = UIKeyboardAppearanceDark
        $define_term_field.returnKeyType = UIReturnKeySearch
        $define_term_field.backgroundColor = 'white'.to_color
        $define_term_field.textColor = 'black'.to_color

  def will_load
    #Telling the Engine to Turn On
    AppleReference start_up
  end

  def on_load
    set_attributes self.view, {
      background_color: 'black'.to_color
    }
    set_attributes self.navigationController.navigationBar, {
      bar_style: UIBarStyleBlack
    }
  end

  def will_appear
    #Allowing the interface to receive notifications from the engine
    @display_notification = App.notification_center.observe 'displayDefinition' do |notification|
      display_apple_reference notification.userInfo
    end

    $define_term_field.delegate = self

    $directional_arrow = add UIView
  end

  def will_disappear
    App.notification_center.unobserve @display_notification
  end

  def textFieldShouldReturn(field)
    if field.text.length > 0
      AppleReference.look_up(field.text.to_s)
      true
    else
      false
    end
  end

  def display_apple_reference(term)
    reference_view = UIReferenceLibraryViewController.alloc.initWithTerm term
    self.presentViewController(reference_view, animated:true, completion:nil)
  end

end