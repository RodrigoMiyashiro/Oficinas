//
//  Navigator.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

protocol Navigator {
    func navigate(to destination: Destination, mode: NavigationMode)
    func navigate(to destination: Destination, mode: NavigationMode, effect: NavigationEffect)
    func set(current: UIViewController)
}
