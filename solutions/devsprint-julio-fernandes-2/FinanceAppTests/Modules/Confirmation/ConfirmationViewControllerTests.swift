//
//  ConfirmationViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationViewControllerTests: XCTestCase {
    
    var sut: ConfirmationViewController?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ConfirmationViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_loadView() {
        sut?.loadView()
        XCTAssertTrue(sut?.view is ConfirmationView)
    }
}
