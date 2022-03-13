//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ContactListPresenterDelegate: AnyObject {

    func showData(_ data: [Contact])
}

class ContactListPresenter: ContactListPresenterProtocol {

    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?

    func viewDidLoad() {

        interactor?.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {

    func didFetchData(_ data: [Contact]) {

        DispatchQueue.main.async {

            self.view?.showData(data)
        }
    }
}
