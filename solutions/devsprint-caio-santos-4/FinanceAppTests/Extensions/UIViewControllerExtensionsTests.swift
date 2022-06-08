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

    // Anderson
    
    func test_insideNavigationController_whenCalledByRepositoryListViewController_ShouldValidate() {
        sut = RepositoryListViewController()
        let navController = sut.insideNavigationController()

        XCTAssertEqual(navController.modalPresentationStyle, .formSheet)
        XCTAssertEqual(navController.viewControllers.count, 1 )
        XCTAssertTrue(navController.viewControllers.first is RepositoryListViewController)
    }

    func test_insideNavigationController_whenCalledByConfirmationViewController_ShouldValidate() {
        sut = ConfirmationViewController()
        let navController = sut.insideNavigationController()

        XCTAssertEqual(navController.modalPresentationStyle, .formSheet)
        XCTAssertEqual(navController.viewControllers.count, 1 )
        XCTAssertTrue(navController.viewControllers.first is ConfirmationViewController)
    }
    
    // Caio
    
    func test_insideNavigationController_whenCalledByUIViewController_ShouldPresentFormSheet() {
        // GIVE
        sut = UIViewController()
        
        // WHEN
        let navigationController = sut.insideNavigationController()

        // THEN
        XCTAssertEqual(navigationController.modalPresentationStyle, .formSheet)
    }
    
    func test_insideNavigationController_whenCalledByUIViewController_ShouldReturnANavigationWithOneViewController() {
        // GIVE
        sut = ConfirmationViewController()
        
        // WHEN
        let navigationController = sut.insideNavigationController()

        // THEN
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }
    
    func test_insideNavigationController_whenCalledByUIViewController_ShouldReturnANavigationWithOneViewControllerOfSpecificType() throws {
        // GIVE
        var navigationController: UINavigationController?
        sut = ConfirmationViewController()
        
        // WHEN
        navigationController = sut.insideNavigationController()
        let validNavigation = try XCTUnwrap(navigationController, "***** Ooops: Found nil navigationController!")
        
        // THEN
        XCTAssertTrue(validNavigation.viewControllers.first is ConfirmationViewController)
        XCTAssertEqual(validNavigation.viewControllers.first, sut)
    }

}
