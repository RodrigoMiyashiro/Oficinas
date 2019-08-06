//
//  AlertMessageDestinationConfiguration.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension AlertMessageDestination {
    func destinationBuilder(title: String, message: String, buttonTitle: String) -> Destination {
        return AlertMessageTypeDestination(title: title,
                                           message: message,
                                           buttonTitle: buttonTitle)
    }
}
