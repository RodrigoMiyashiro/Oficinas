//
//  ListCarRepairSummaryViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreLocation

class ListCarRepairSummaryViewController: BaseConfigurationViewController, CarRepairSummaryShowScreen {
    internal var presenter: CarRepairPresenter?
    internal var dataSourceDelegateForCarRepairSummaryTableView = TableViewForCarRepairSummary()
    internal var locationManager: CLLocationManager?
    internal var coordinate: CLLocationCoordinate2D?
    internal var wasCalledInfiniteScroll: Bool = false

    internal var listCarRepairSummary: ListCarRepairSummary? {
        didSet {
            self.dataSourceDelegateForCarRepairSummaryTableView.listCarRepairSummary = self.listCarRepairSummary
            self.carRepairSummaryTableView.reloadData()
        }
    }

    internal var refreshControl: UIRefreshControl?

    @IBOutlet weak var inputAddressTextField: UITextField!
    @IBOutlet weak var searchAddressButton: UIButton!
    @IBOutlet weak var carRepairSummaryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
    }

    private func initializer() {
        self.configureTitle("Oficinas")
        self.configureTableView()
        self.configureAddressTextField()
        self.configureAddressButton()
        self.configureInfinityScroll()
        self.configureRefreshControl()
        self.configureLocation()
    }

    func displayableListCarRepair(_ listCarRepair: ListCarRepairSummary) {
        self.prepareForDisplayable(listCarRepair)
        self.refreshControl?.endRefreshing()
        self.stopActivityIndicator()
    }

    private func prepareForDisplayable(_ listCarRepair: ListCarRepairSummary) {
        if !self.wasCalledInfiniteScroll {
            self.listCarRepairSummary = listCarRepair
            return
        }

        var temporaryListCarRepair: [CarRepair] = self.listCarRepairSummary?.carRepairs ?? []
        temporaryListCarRepair += listCarRepair.carRepairs
        self.listCarRepairSummary?.carRepairs = temporaryListCarRepair
        self.listCarRepairSummary?.nextPageToken = listCarRepair.nextPageToken
    }

    func showErroObtainingListCarRepairSummary() {
        self.stopActivityIndicator()
        self.refreshControl?.endRefreshing()
        self.showAlert(withMessage: "Não foi possível mostrar as oficinas perto no momento. Tente novamente mais tarde.")
    }
}
