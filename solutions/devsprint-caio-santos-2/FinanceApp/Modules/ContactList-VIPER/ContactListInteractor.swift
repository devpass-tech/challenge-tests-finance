//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {

    func didFetchData(_ data: [Contact])
}

class ContactListInteractor: ContactListInteractorProtocol {

    weak var presenter: ContactListInteractorDelegate?

    private let service: FinanceServiceProtocol

    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {

        service.fetchContactList { contacts in

            self.presenter?.didFetchData(contacts ?? [])
        }
    }
}
