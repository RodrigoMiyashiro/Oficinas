//
//  CarRepairDetailDestination.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairDetailDestination: Destination {
    private let placeID: String?
    private var createdViewController: UIViewController?

    init(placeID: String?) {
        self.placeID = placeID
    }

    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            let destination = self.destinationBuilder()
            var screen = destination.viewController as! CarRepairDestinationScreen
            screen.placeID = self.placeID

            return screen as! UIViewController
        }
    }
}
