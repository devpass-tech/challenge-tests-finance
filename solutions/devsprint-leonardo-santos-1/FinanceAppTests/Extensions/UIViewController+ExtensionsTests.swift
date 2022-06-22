//
//  UIViewControllerExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 22/06/22.
//

import XCTest
@testable import FinanceApp

class UIViewControllerExtensionsTests: XCTestCase {
    
    func test_insideNavigationController_modalPresentationStyleShouldBeFormSheet() {
        let viewController = ViewControllerDouble()
        let navigationController = viewController.insideNavigationController()
        let modalPresentationStyle = navigationController.modalPresentationStyle
        
        XCTAssertEqual(modalPresentationStyle, .formSheet)
    }
    
    func test_insideNavigationController_rootViewControllerShouldBeItsCaller() {
        let callerViewController = ViewControllerDouble()
        let navigationController = callerViewController.insideNavigationController()
        let navigationRootViewController = navigationController.viewControllers.first
        
        XCTAssertEqual(navigationRootViewController, callerViewController)
    }
    
}
