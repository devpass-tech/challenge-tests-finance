//
//  UIViewController+ExtensionsTests.swift
//  FinanceAppUITests
//
//  Created by Gabriel de Castro Chaves on 18/08/22.
//
import UIKit
import XCTest
@testable import FinanceApp

class DummyViewController: UIViewController {
    
}

class UIViewController_ExtensionsTests: XCTestCase {
    
    
    func testShouldReturnAnavigationController() {
        //GIVEN
        let sut = DummyViewController()
        
        //WHEN
        let navigationController = sut.insideNavigationController()
        
        //THEN
        XCTAssertEqual(navigationController.viewControllers.first, sut)
        XCTAssertEqual(navigationController.modalPresentationStyle, .formSheet)
        
    }
}

