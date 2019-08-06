//
//  SafariViewControllerDestination.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewControllerDestination: Destination {
    private var createdViewController: UIViewController?
    private var urlString: String
    
    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            guard let url = URL(string: self.urlString) else {
                return UIViewController()
            }

            let destination = self.destinationBuilder(url: url)
            let screen = destination.viewController
        
            return screen
        }
    }

    init(urlString: String) {
        self.urlString = urlString
    }
}
