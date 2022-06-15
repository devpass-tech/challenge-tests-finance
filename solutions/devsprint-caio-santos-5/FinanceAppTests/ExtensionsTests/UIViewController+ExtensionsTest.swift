//
//  InsideNavigationControllerTest.swift
//  FinanceAppTests
//
//  Created by Elena Diniz on 6/7/22.
//

import XCTest
@testable import FinanceApp

final class InsideNavigationControllerTest: XCTestCase {
    
    func test_insideNavigation_PositiveCase() throws {
        let mockController = UIViewController()
        let result = mockController.insideNavigationController()
        
        XCTAssertTrue(result.modalPresentationStyle == .formSheet)
        XCTAssertNotNil(result.viewControllers.first)
        XCTAssertEqual(result.viewControllers.count, 1)
    }
}
