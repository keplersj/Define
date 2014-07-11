##
##  Original Objective-C Header: BackEnd.h
##  Original Objective-C Implementation: BackEnd.m
##  Original Xcode Project Name: Dictionary
##
##  Objective-C Header Before Ruby Port: AppleReference.h
##  Objective-C Implementation Before Ruby Port: AppleReference.m
##
##  apple_reference.rb
##  Define
##
##  Currently running under RubyMotion. http://www.rubymotion.com/
##
##  Created by Kepler Sticka-Jones on 10/19/12.
##  Ported to Ruby by Kepler Sticka-Jones on 9/6/14.
##
##  Copyright (c) 2012-2014 Kepler Sticka-Jones. All rights reserved.
##  This code is licensed on MIT. https://raw.githubusercontent.com/k2b6s9j/Define/master/LICENSE
##

## Contains methods nessacery for native functionality on Apple devices.
class AppleReference < Define::Source

  ## Calls the Apple Reference Library to memory with a dumby term.
  def start_up
    UIReferenceLibraryViewController.alloc.initWithTerm('Kepler')
  end

  ## Calls the Apple Reference Library to find a definition for a term and send a notification when found.
  def look_up(term='')
    case term
      when UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(term)
        App.notification_center.post('displayDefinition', object: self, info: term)
        true
      else
        false
    end
  end

  ## The un_load method is not called simply due to the fact that RubyMotion handles all memory functions.

end