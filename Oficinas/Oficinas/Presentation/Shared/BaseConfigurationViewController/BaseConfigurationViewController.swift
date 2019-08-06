//
//  BaseConfigurationViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class BaseConfigurationViewController: UIViewController {
    private var activityIndicator: ActivityIndicator?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)
    }

    private func initializer() {
        self.configureActivityIndicator()
    }

    private func configureActivityIndicator() {
        self.activityIndicator = ActivityIndicator(frame: self.view.frame)
    }

    func configureTitle(_ title: String) {
        let navigationBar = self.navigationController?.navigationBar
        let topItem = navigationBar?.topItem

        topItem?.title = title
    }

    func startActivityIndicator() {
        guard let activityIndicator = self.activityIndicator else {
            return
        }

        self.view.addSubview(activityIndicator)
    }

    func stopActivityIndicator() {
        self.activityIndicator?.removeFromSuperview()
    }
}
