//
//  RemovingSpacesTests.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 08/06/22.
//

import XCTest
@testable import FinanceApp

class RemovingSpacesTests: XCTestCase {
    
    func test_RemovingSpaces() {
        let previewString = "removing  spaces test"
        let expectdString = "removingspacestest"
        let resultString = previewString.removingSpaces()
        
        XCTAssertEqual(expectdString, resultString)
    }
}
