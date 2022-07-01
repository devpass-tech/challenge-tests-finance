//
//  UIViewControllerExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 22/06/22.
//

import XCTest
@testable import FinanceApp

final class UIViewControllerExtensionsTests: XCTestCase {
    private let sut = UIViewController()
    
    func test_insideNavigationController_modalPresentationStyleShouldBeFormSheet() {
        let navigationController = sut.insideNavigationController()
        let modalPresentationStyle = navigationController.modalPresentationStyle
        
        XCTAssertEqual(modalPresentationStyle, .formSheet)
    }
    
    func test_insideNavigationController_navigationsRootViewControllerShouldBeItsCaller() {
        let navigationController = sut.insideNavigationController()
        let navigationRootViewController = navigationController.viewControllers.first
        
        XCTAssertEqual(navigationRootViewController, sut)
    }
}
