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
    
    private var sut = RepositoryListViewController()
    
    override func setUpWithError() throws {
        sut = RepositoryListViewController()
    }
    
    func testModalPresentationStyle() {
        let navController = sut.insideNavigationController()
        XCTAssertEqual(navController.modalPresentationStyle, .formSheet)
        XCTAssertFalse(navController.modalPresentationStyle == .fullScreen)
    }
    
    func testNavigationControllerRoot() {
        let navController = sut.insideNavigationController()
        XCTAssertEqual(navController.topViewController, sut)
        XCTAssert(navController.viewControllers.first == sut)
        XCTAssert(navController.viewControllers.count == 1 )
    }
}
