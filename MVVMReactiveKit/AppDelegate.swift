//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let pixelBayService = PixelBayService()
        let viewControllerContext = ViewControllerContext(pixelBayService: pixelBayService)
        let imageListViewController = ImageListViewController(context: viewControllerContext)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: imageListViewController)
        window?.makeKeyAndVisible()

        return true
    }

}

