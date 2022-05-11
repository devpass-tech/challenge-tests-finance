//
//  UIViewControllerExtensionTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Lemos on 11/05/22.
//

import XCTest
@testable import FinanceApp

class UIViewControllerExtensionTests: XCTestCase {

    private var sut: HomeViewController!

    override func setUpWithError() throws {
        sut = HomeViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_insideNavigationController_shouldReturnUINavigationController() {
        // When
        let navigationController = sut.insideNavigationController()

        // Then
        XCTAssertEqual(navigationController.viewControllers.first, sut)
        XCTAssertTrue(type(of: navigationController) == UINavigationController.self)
    }

    func test_insideNavigationController_modalPresentationShouldBeFormSheet() {
        // When
        let navigationController = sut.insideNavigationController()

        // Then
        XCTAssertEqual(navigationController.modalPresentationStyle, .formSheet)
    }

}
