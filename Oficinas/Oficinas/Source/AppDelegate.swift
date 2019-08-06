//
//  AppDelegate.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigator: Navigator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.initialDestination()
        
        return true
    }
    
    private func initialDestination() {
        self.navigator = DefaultNavigator(self.window!)
        self.navigator?.navigate(to: CarRepairSummaryTypeDestination(),
                                 mode: .fromRoot)
    }
}

