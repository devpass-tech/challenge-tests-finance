//
//  InsideNavigationControllerTests.swift
//  FinanceAppTests
//
//  Created by Cora on 06/06/22.
//

import Foundation
import XCTest
@testable import FinanceApp

class UIViewControllerExtensionsTests: XCTestCase {

    private var sut: UIViewController!

    override func setUpWithError() throws {}

    func test_insideNavigationController_whenCalledByRepositoryListViewController_ShouldVadalite() {
        sut = RepositoryListViewController()
        let navController = sut.insideNavigationController()

        XCTAssertEqual(navController.modalPresentationStyle, .formSheet)
        XCTAssertEqual(navController.viewControllers.count, 1 )
        XCTAssertTrue(navController.viewControllers.first is RepositoryListViewController)
    }

    func test_insideNavigationController_whenCalledByConfirmationViewController_ShouldVadalite() {
        sut = ConfirmationViewController()
        let navController = sut.insideNavigationController()

        XCTAssertEqual(navController.modalPresentationStyle, .formSheet)
        XCTAssertEqual(navController.viewControllers.count, 1 )
        XCTAssertTrue(navController.viewControllers.first is ConfirmationViewController)
    }
}
