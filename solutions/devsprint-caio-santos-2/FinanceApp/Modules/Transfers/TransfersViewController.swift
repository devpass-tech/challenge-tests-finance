//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController, UITextFieldDelegate {
    
    lazy var transferView: TransfersView = {
        
        let transferView = TransfersView()
        transferView.delegate = self
        transferView.amountTextField.delegate = self
        return transferView
    }()
    
    override func loadView() {
        self.view = transferView
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        transferView.amountTextField.resignFirstResponder()
    }
}

extension TransfersViewController: TransferViewDelegate {
    
    func didPressChooseContactButton() {
        
        let contactViewController = ContactListRouter.createModule()
        
        self.present(contactViewController, animated: true)
    }
    
    func didPressTransferButton() {
        
        let navigationController = UINavigationController(rootViewController: ConfirmationViewController())
        self.present(navigationController, animated: true)
    }
}
