//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        let navigationController = window.rootViewController as UINavigationController
        let viewController = navigationController.topViewController as ViewController

        let event = Event(id:1)
        event.quantity = 4

        viewController.setEvent(event)

        return true
    }
}

