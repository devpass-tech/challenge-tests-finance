//
//  TrasnfersViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 24/06/22.
//

import XCTest
@testable import FinanceApp

class TransfersViewControllerTests: XCTestCase {

    let sut = TransferViewControllerSpy()
    
    func test_didPressTransferButton_isCalled() {
        sut.didPressChooseContactButton()
        XCTAssertTrue(sut.chooseContactButtonPressed)
    }
    
    func test_didPressChooseContactButton_isCalled() {
        sut.didPressTransferButton()
        XCTAssertTrue(sut.transferButtonPressed)
    }
}

class TransferViewControllerSpy: TransferViewDelegate {
    
    var chooseContactButtonPressed: Bool = false
    var transferButtonPressed: Bool = false
    
    func didPressChooseContactButton() {
        chooseContactButtonPressed = true
    }
    
    func didPressTransferButton() {
        transferButtonPressed = true
    }
    
    
}
