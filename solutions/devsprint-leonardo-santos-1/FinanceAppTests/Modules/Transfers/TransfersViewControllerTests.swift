//
//  TrasnfersViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 24/06/22.
//

import XCTest
@testable import FinanceApp

class TransfersViewControllerTests: XCTestCase {

    let sut = TransfersViewControllerSpy()
    
    func test_didPressTransferButton_isCalled() {
        sut.didPressChooseContactButton()
        XCTAssertTrue(sut.chooseContactButtonPressed)
    }
    
    func test_didPressChooseContactButton_isCalled() {
        sut.didPressTransferButton()
        XCTAssertTrue(sut.transferButtonPressed)
    }
    
    func test_didPressTransferButton_showPresent() {
        let sut = TransfersViewControllerSpy()
        sut.didPressTransferButton()
        XCTAssertTrue(sut.presentCalled)
    }
    
    func test_didPressChooseContadtButton_showPresent() {
        let sut = TransfersViewControllerSpy()
        sut.didPressChooseContactButton()
        XCTAssertTrue(sut.presentCalled)
    }
}

class TransfersViewControllerSpy: UIViewController, TransferViewDelegate  {
    
    var chooseContactButtonPressed: Bool = false
    var transferButtonPressed: Bool = false
    var presentCalled: Bool = false
    
    func didPressChooseContactButton() {
        chooseContactButtonPressed = true
        let navigationController = UINavigationController(rootViewController: ContactListViewController())
        self.present(navigationController, animated: true)
    }
    
    func didPressTransferButton() {
        transferButtonPressed = true
        let navigationController = UINavigationController(rootViewController: ConfirmationViewController())
        self.present(navigationController, animated: true)

    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCalled = true
    }
    
    
}
