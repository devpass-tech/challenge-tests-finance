//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

class ContactListRouter: ContactListRouterProtocol {

    static func createModule() -> UINavigationController {

        let networkClient = NetworkClient()
        let service = FinanceService(networkClient: networkClient)

        let viewController = ContactListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = ContactListPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = ContactListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ContactListInteractor(service: service)
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }

    func navigateToNewModule() {

    }
}
