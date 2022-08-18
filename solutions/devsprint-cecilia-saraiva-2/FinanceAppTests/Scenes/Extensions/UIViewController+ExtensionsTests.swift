//
//  UIViewController+ExtensionsTests.swift
//  FinanceAppUITests
//
//  Created by Gabriel de Castro Chaves on 18/08/22.
//
import UIKit
import XCTest
@testable import FinanceApp

final class DummyViewController: UIViewController {
    
}

final class UIViewController_ExtensionsTests: XCTestCase {
    
    
    func testShouldReturnInsideNavigationController() {
        //GIVEN
        let sut = DummyViewController()
        
        //WHEN
        let navigationController = sut.insideNavigationController()
        
        //THEN
        XCTAssertEqual(navigationController.viewControllers.first, sut)
        XCTAssertEqual(navigationController.modalPresentationStyle, .formSheet)
        
    }
}

