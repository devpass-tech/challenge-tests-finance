//
//  StringExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

class StringExtensionsTests: XCTestCase {
    
    let expectedResult = "HelloWord"
    
    func test_removingSpaces_whenStringIsEmpty_shouldReturnsEmptyString() {
        let text = ""
        XCTAssertEqual(text.removingSpaces(), "")
    }
    
    func test_removingSpaces_whenStringHasOneSpace_shouldReturnsStringWithoutSpace() {
        let text = "Hello Word"
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
    
    func test_removingSpaces_whenStringHasTowSpace_shouldReturnsStringWithoutSpace() {
        let text = "Hello  Word"
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
    
    func test_removingSpaces_whenStringHasSpaceAtTheBeginningAndSpaceAtTheEndAndBetweenThem_shouldReturnsStringWithoutSpace() {
        let text = " Hello Word "
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
    
    func test_removingSpaces_whenStringHasMoreThanTwoWordsWithSpacesBetweenTheWords_shouldReturnsStringWithoutSpace() {
        let text = "Hello Beautiful World"
        XCTAssertEqual(text.removingSpaces(), "HelloBeautifulWorld")
    }
    
    func test_removingSpaces_whenStringHasSpaceAtTheBeginningAndSpaceAtTheEnd_shouldReturnsStringWithoutSpace() {
        let text = " HelloWord "
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
}
