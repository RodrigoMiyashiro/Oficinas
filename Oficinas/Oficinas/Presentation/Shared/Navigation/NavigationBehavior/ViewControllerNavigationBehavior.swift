//
//  ViewControllerNavigationBehavior.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController {
    var navigator: Navigator? {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)?.navigator
        }
    }
}
