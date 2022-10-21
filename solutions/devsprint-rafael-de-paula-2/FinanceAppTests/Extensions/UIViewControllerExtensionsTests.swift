//
//  UIViewControllerExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

class UIViewControllerExtensionsTests: XCTestCase {

    func test_insideNavigationController_modalPresentationStyleIsFormSheet() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.formSheet)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotCurrentContext() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.currentContext)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotPopOver() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.popover)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotFullScreen() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.fullScreen)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotAutomatic() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.automatic)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotPageSheet() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.pageSheet)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotCustom() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.custom)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotOverFullScreen() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.overFullScreen)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotOverCurrentContext() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.overCurrentContext)
    }
    
    func test_insideNavigationController_modalPresentationStyleIsNotNone() {
        let viewController = UIViewController()
        let navigationController = viewController.insideNavigationController()
        
        XCTAssertNotEqual(navigationController.modalPresentationStyle, UIModalPresentationStyle.none)
    }

}
