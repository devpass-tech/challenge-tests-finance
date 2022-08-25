//
//  UIViewController+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 23/08/22.
//

import XCTest
@testable import FinanceApp

final class DummyViewController: UIViewController {
    
}

final class UIViewController_ExtensionsTests: XCTestCase {

    func testInsideNavigationController() {
                
        let sut = DummyViewController()
        
        let navigationController = sut.insideNavigationController()
        
        XCTAssertEqual(navigationController.viewControllers.first, sut)
        XCTAssertEqual(navigationController.modalPresentationStyle, .formSheet)
    }
}
