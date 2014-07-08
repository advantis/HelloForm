//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {

        let event = Event(id:1)
        event.quantity = 4

        let controller = ViewController()
        controller.setEvent(event)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()

        return true
    }
}

