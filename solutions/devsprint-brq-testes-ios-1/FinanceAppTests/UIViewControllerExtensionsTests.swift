//
//  UIViewControllerExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

final class UIViewControllerExtensionsTests: XCTestCase {
    
    func test_insideNavigationController_viewControlerShouldIsInNavigation() {
        let sut = DummyVC().insideNavigationController()
        
        XCTAssertEqual(sut.modalPresentationStyle, .formSheet)
        XCTAssertTrue(sut.topViewController is DummyVC)
    }
}

class DummyVC: UIViewController {
}
