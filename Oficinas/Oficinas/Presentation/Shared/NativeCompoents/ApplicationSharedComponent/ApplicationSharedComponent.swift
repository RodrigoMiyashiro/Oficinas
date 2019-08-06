//
//  ApplicationSharedComponent.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ApplicationSharedComponent {
    func open(_ path: String) {
        guard let url = URL(string: path) else {
            return
        }

        let application = UIApplication.shared
        guard application.canOpenURL(url) else {
            return
        }

        if #available(iOS 10.0, *) {
            application.open(url, options: [:], completionHandler: nil)
        } else {
            application.openURL(url)
        }
    }
}
