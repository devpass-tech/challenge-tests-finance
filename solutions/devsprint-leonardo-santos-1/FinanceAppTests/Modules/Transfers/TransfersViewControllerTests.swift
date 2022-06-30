//
//  TrasnfersViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 24/06/22.
//

import XCTest
@testable import FinanceApp

class TransfersViewControllerTests: XCTestCase {

    let sut = TransfersViewController()
    
    func test_didPressTransferButton_showPresent() {
        sut.didPressTransferButton()
        let topMostViewController = sut.nextNavigationController?.viewControllers.last
        XCTAssertTrue(topMostViewController is ConfirmationViewController)
    }
    
    func test_didPressChooseContactButton_showPresent() {
        sut.didPressChooseContactButton()
        let topMostViewController = sut.nextNavigationController?.viewControllers.last
        XCTAssertTrue(topMostViewController is ContactListViewController)
    }
}
