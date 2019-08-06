//
//  SafariViewControllerDestinationConfiguration.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension SafariViewControllerDestination {
    func destinationBuilder(url: URL) -> Destination{
        return SafariViewControllerTypeDestination(url: url)
    }
}
