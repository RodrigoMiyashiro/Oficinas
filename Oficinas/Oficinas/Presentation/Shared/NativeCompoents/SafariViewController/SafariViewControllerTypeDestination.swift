//
//  SafariViewControllerTypeDestination.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewControllerTypeDestination: Destination {
    private var url: URL

    var viewController: UIViewController {
        get {
            let safariViewController = SFSafariViewController(url: self.url)

            return safariViewController
        }
    }

    init(url: URL) {
        self.url = url
    }
}
