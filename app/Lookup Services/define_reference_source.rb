##
##  Original Objective-C Header: DictonaryReferenceSource.h
##  Original Objective-C Implementation: DictonaryReferenceSource.m
##  Original Xcode Project Name: Dictionary
##
##  define_reference_source.rb
##  Define
##
##  Currently running under RubyMotion. http://www.rubymotion.com/
##
##  Created by Kepler Sticka-Jones on 10/15/13.
##  Ported to Ruby by Kepler Sticka-Jones on 9/6/14.
##
##  Copyright (c) 2012-2014 Kepler Sticka-Jones. All rights reserved.
##  This code is licensed on MIT. https://raw.githubusercontent.com/k2b6s9j/Define/master/LICENSE
##

class DefineReferenceSource

  def startUp

    NSLog('Something tried to intiialize something. Someone will figure it out eventually.')

  end

  def lookUp(term='')

    NSLog("Something just tried to look up the term #{term}")
    false

  end

  def unLoad

    NSLog('Whatever hasn\'t been unloaded and could be better be now!')
    NSLog('We probably don\'t need this now that we\'re using RubyMotion and it\'s awesome!')

  end

end