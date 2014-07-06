class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    startFlurry
    createWindow

    true

  end

  def startFlurry

    Flurry startSession 'CWNCT873QSVSBRNNVK4H'

  end

  def createWindow

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = DefineViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

  end

end
