//
//  DefaultNavigator.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class DefaultNavigator: Navigator {
    private unowned let window: UIWindow

    private var root: UIViewController?
    private var currentViewController: UIViewController?

    init(_ window: UIWindow) {
        self.window = window
    }

    func navigate(to destination: Destination, mode: NavigationMode) {
        self.navigate(to: destination,
                      mode: mode,
                      effect: .normal)
    }

    func navigate(to destination: Destination, mode: NavigationMode, effect: NavigationEffect) {
        defer {
            self.currentViewController = destination.viewController
        }

        let destinationViewController = destination.viewController

        self.setTransitionStyle(of: destinationViewController, for: effect)

        guard let root = self.root else {
            self.setRoot(destinationViewController)
            return
        }

        if let navigatorController = self.currentViewController?.navigationController {
            navigatorController.pushViewController(destinationViewController, animated: true)
            return
        }

        root.present(destinationViewController, animated: true, completion: nil)
    }

    func set(current: UIViewController) {
        if let existingRootViewControlelr = self.window.rootViewController {
            self.root = existingRootViewControlelr
        }

        self.currentViewController = current
    }

    private func setRoot(_ root: UIViewController) {
        self.root = root
        self.window.rootViewController = self.root
        self.window.makeKeyAndVisible()
    }

    private func shouldSetRoot() -> Bool {
        return self.window.rootViewController == nil
    }

    private func setTransitionStyle(of viewController: UIViewController, for effect: NavigationEffect) {
        if effect == .flip {
            viewController.modalTransitionStyle = .flipHorizontal
        }
    }
}
