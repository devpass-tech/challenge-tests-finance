//
//  UIViewController+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class UIViewController_ExtensionsTests: XCTestCase {

    func test_insideNavigationController()  {
        let sut = UIViewController()
        XCTAssertNil(sut.navigationController)
        
        _ = sut.insideNavigationController()
        
        XCTAssertNotNil(sut.navigationController)
        XCTAssertEqual(sut.navigationController?.modalPresentationStyle, .formSheet)
    }
    
}

