//
//  HomeTableViewController.swift
//  FinanceApp
//
//  Created by Willian Policiano on 22/03/22.
//

import Core
import UIKit

class HomeTableViewController: UITableViewController {
    private let service: HomeLoader
    private var home: HomeViewModel = HomeViewModel() {
        didSet {
            tableView.reloadData()
        }
    }

    init(service: HomeLoader) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(getHome), for: .valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getHome()
    }

    @objc
    func getHome() {
        refreshControl?.beginRefreshing()

        service.getHome { [weak self] result in
            self?.refreshControl?.endRefreshing()

            switch result {
            case let .success(home):
                self?.home = HomeViewModel(home: home)
            case .failure:
                let alert = UIAlertController(
                    title: "Ops!",
                    message: "Algo de errado aconteceu. Tente novamente.",
                    preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
                alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default) { [weak self] _ in
                    self?.getHome()
                })

                self?.present(alert, animated: true)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        home.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let row = home.rows[indexPath.row]

        switch row {
        case let .untitled(value):
            let cell = BalanceCell()
            cell.display(value: value)
            return cell
        case let .titled(title, value):
            let cell = FinanceCell()
            cell.display(title: title, value: value)
            return cell
        }
    }
}
