//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController {
    
    var nextNavigationController: UINavigationController?

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
}

extension TransfersViewController: TransferViewDelegate {

    func didPressChooseContactButton() {
        nextNavigationController = UINavigationController(rootViewController: ContactListViewController())
        present(nextNavigationController!, animated: true)
    }

    func didPressTransferButton() {
        nextNavigationController = UINavigationController(rootViewController: ConfirmationViewController())
        present(nextNavigationController!, animated: true)
    }
}
