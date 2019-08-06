//
//  CarRepairDetailViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairDetailViewController: BaseConfigurationViewController, CarRepairDestinationScreen, CarRepairDetailShowScreen, NativeComponentsBehavior {
    var placeID: String?
    private var dataSourceDelegateForCarRepairDetailTableView = TableViewForCarRepairDetail()
    private var presenter: CarRepairDetailPresenter?
    private var carRepairDetail: CarRepairDetail? {
        didSet {
            self.dataSourceDelegateForCarRepairDetailTableView.carRepairDetail = self.carRepairDetail
            self.carRepairDetailTableView.reloadData()
        }
    }

    @IBOutlet weak var carRepairDetailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
    }

    private func initializer() {
        self.title = "Oficina - detalhe"
        self.configureTableView()

        self.startRequest()
    }

    private func configureTableView() {
        self.carRepairDetailTableView.dataSource = self.dataSourceDelegateForCarRepairDetailTableView
        self.carRepairDetailTableView.delegate = self.dataSourceDelegateForCarRepairDetailTableView
        self.carRepairDetailTableView.tableFooterView = UIView()

        self.dataSourceDelegateForCarRepairDetailTableView.accessingNativeComponentsDelegate = self

        self.registerNibs()
    }

    private func registerNibs() {
        let nibNameForDescriptionCell = UINib(nibName: DescriptionTableViewCell.identifier,
                                              bundle: nil)
        self.carRepairDetailTableView.register(nibNameForDescriptionCell,
                                               forCellReuseIdentifier: DescriptionTableViewCell.identifier)

        let nibNameForMapCell = UINib(nibName: MapTableViewCell.identifier,
                                      bundle: nil)
        self.carRepairDetailTableView.register(nibNameForMapCell,
                                               forCellReuseIdentifier: MapTableViewCell.identifier)

        let nibNameForWeekdayCell = UINib(nibName: WeekdayTableViewCell.identifier,
                                          bundle: nil)
        self.carRepairDetailTableView.register(nibNameForWeekdayCell,
                                               forCellReuseIdentifier: WeekdayTableViewCell.identifier)

        let nibNameForPhotoCell = UINib(nibName: PhotosTableViewCell.identifier,
                                        bundle: nil)
        self.carRepairDetailTableView.register(nibNameForPhotoCell,
                                               forCellReuseIdentifier: PhotosTableViewCell.identifier)

        let nibNameForReview = UINib(nibName: ReviewsTableViewCell.identifier,
                                     bundle: nil)
        self.carRepairDetailTableView.register(nibNameForReview,
                                               forCellReuseIdentifier: ReviewsTableViewCell.identifier)
    }

    private func hideTableView(_ isHidden: Bool) {
        self.carRepairDetailTableView.isHidden = isHidden
    }

    func startRequest() {
        self.hideTableView(true)
        
        guard let placeID = self.placeID else {
            self.showAlert(withMessage: "Não foi possível encontrar os detalhes da oficina.")
            return
        }
        self.startActivityIndicator()

        let executor = DefaultCarRepairDetailExecutor()
        self.presenter = CarRepairDetailPresenter(screen: self, executor: executor)
        self.presenter?.retrieveCarRepairDetail(withPlaceID: placeID)
    }

    func displayableCarRepairDetail(_ carRepairDetail: CarRepairDetail) {
        self.stopActivityIndicator()
        self.hideTableView(false)
        self.carRepairDetail = carRepairDetail
    }

    func showErrorObtainingCarRepairDetail() {
        self.stopActivityIndicator()
        self.showAlert(withMessage: "Não foi possível mostrar os detalhes da oficina no momento. Tente novamente mais tarde.")
    }
}
