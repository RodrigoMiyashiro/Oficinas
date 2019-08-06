//
//  ListCarRepairSummaryViewControllerConfigureRequests.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIScrollView_InfiniteScroll

extension ListCarRepairSummaryViewController {
    internal func configureInfinityScroll() {
        self.carRepairSummaryTableView.addInfiniteScroll { (tableView) in
            tableView.performBatchUpdates({
                self.wasCalledInfiniteScroll = true
                if let nextPageToken = self.listCarRepairSummary?.nextPageToken {
                    self.startRequest(withLocation: self.currentLocation(), nextPageToken: nextPageToken)
                }
            }, completion: { _ in
                tableView.finishInfiniteScroll()
            })
        }
    }

    internal func configureRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)

        guard let refreshControl = self.refreshControl else {
            return
        }

        self.carRepairSummaryTableView.addSubview(refreshControl)
    }

    @objc private func refresh(_ sender: AnyObject) {
        self.wasCalledInfiniteScroll = false
        self.startRequest(withLocation: self.currentLocation())
    }

    internal func initialRequest(withLocation location: String) {
        self.wasCalledInfiniteScroll = false
        self.startActivityIndicator()
        self.startRequest(withLocation: location)
    }

    internal func startRequest(withLocation location: String, nextPageToken: String? = nil) {
        let executor = DefaultCarRepairSummaryExecutor()

        self.presenter = CarRepairPresenter(screen: self, executor: executor)
        self.presenter?.retrieveListCarRepairSummary(location: location, nextPageToken: nextPageToken)
    }
}
