//
//  StringExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 08/06/22.
//

import XCTest
@testable import FinanceApp

class StringExtensionsTests: XCTestCase {
    
    // VINI
    
    func test_RemovingSpaces() {
        let previewString = "removing  spaces test"
        let expectdString = "removingspacestest"
        let resultString = previewString.removingSpaces()
        
        XCTAssertEqual(expectdString, resultString)
    }
    
    // CAIO
    
    func test_removingSpaces_whenPassAFullName_ShouldReturnANameWhitoutSpaces() {
        // GIVE
        let sut = "CAIO SANTOS"
        
        // WHEN
        let result = sut.removingSpaces()

        // THEN
        XCTAssertEqual(result, "CAIOSANTOS")
    }
    
    func test_removingSpaces_whenPassAEmptyString_ShouldReturnAEmptyString() {
        // GIVE
        let sut = ""
        
        // WHEN
        let result = sut.removingSpaces()

        // THEN
        XCTAssertEqual(result, "")
    }
    
    func test_removingSpaces_whenPassALotOfSpaces_ShouldReturnAEmptyString() {
        // GIVE
        let sut = "                           "
        
        // WHEN
        let result = sut.removingSpaces()

        // THEN
        XCTAssertEqual(result, "")
    }
}
