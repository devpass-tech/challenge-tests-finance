//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {

    private let contactListView: ContactListView = {

        let contactListView = ContactListView()
        return contactListView
    }()

    var presenter: ContactListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func loadView() {
        self.view = contactListView
    }
}

extension ContactListViewController: ContactListPresenterDelegate {

    func showData(_ data: [Contact]) {

        contactListView.updateView(with: data)
    }
}


