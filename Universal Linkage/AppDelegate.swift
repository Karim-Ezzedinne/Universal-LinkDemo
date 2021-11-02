//
//  AppDelegate.swift
//  Universal Linkage
//
//  Created by Kyle Lee on 1/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let navigator = Navigator()

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        guard let url = userActivity.webpageURL else { return false }
        
        guard let viewController = navigator.getDestination(for: url) else {
            
            application.open(url)
            
            return false
        }
        
        window?.rootViewController = viewController
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}


