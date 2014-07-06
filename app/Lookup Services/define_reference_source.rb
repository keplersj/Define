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