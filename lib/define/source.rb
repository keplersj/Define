module Define

  ##
  ##  Original Objective-C Header: DictonaryReferenceSource.h
  ##  Original Objective-C Implementation: DictonaryReferenceSource.m
  ##  Original Xcode Project Name: Dictionary
  ##
  ##  File name when ported to RubyMotion: define_reference_source.rb
  ##
  ##  source.rb
  ##  Define
  ##
  ##  Created by Kepler Sticka-Jones on 10/15/13.
  ##  Ported to Ruby by Kepler Sticka-Jones on 9/6/14.
  ##
  ##  Copyright (c) 2012-2014 Kepler Sticka-Jones. All rights reserved.
  ##  This code is licensed on MIT. https://raw.githubusercontent.com/k2b6s9j/Define/master/LICENSE
  ##

  ## Contains all the methods and variables needed when interacting with a reference source.
  ## Extend this to allow applications implementing the Define stack to access a new reference source.
  class Source

    ## Call this when your application begins to ensure the reference is functional.
    def start_up

      NSLog('Something tried to intiialize something. Someone will figure it out eventually.')
      true

    end

    ## Call this to attempt a reference term look up.
    ## Will return false when either the term cannot be defined or the source is not avalible.
    ## Will return true when the term is found.
    def look_up(term='')

      NSLog("Something just tried to look up the term #{term}")
      false

    end

    ## Call this whe destructing your application.
    def un_load

      NSLog('Whatever hasn\'t been unloaded and could be better be now!')
      NSLog('We probably don\'t need this now that we\'re using RubyMotion and it\'s awesome!')

    end

  end

end
