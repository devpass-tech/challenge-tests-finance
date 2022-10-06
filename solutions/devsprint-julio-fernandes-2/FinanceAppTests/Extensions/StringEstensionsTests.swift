//
//  StringEstensionsTests.swift
//  FinanceAppTests
//
//  Created by Marcio Habigzang Brufatto on 05/10/22.
//

import XCTest

@testable import FinanceApp

final class StringEstensionsTests: XCTestCase {
    
    let expectedResult = "HelloWord"
    
    func test_removingSpaces_whenStringHasOneSpace_shouldReturnStringWithoutSpaces() {
        let text = "Hello Word"
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
    
    func test_removingSpaces_whenStringHasTwoSpaces_shouldReturnStringWithoutSpaces() {
        let text = "Hello  Word"
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
    
    func test_removeSpaces_whenStringHasEmpty_shouldReturnsEmptyString() {
        let text = ""
        XCTAssertEqual(text.removingSpaces(), "")
    }
    
    func test_removeSpaces_whenStringHasSpacesAtBeginningAndAtEnd_shouldReturnsStringWithoutSpaces() {
        let text = " Hello Word "
        XCTAssertEqual(text.removingSpaces(), expectedResult)
    }
    
    func test_removeSpaces_whenStringHasMoreThanTwoWordsAndSpaceBetweenThem_shouldReturnsStringWithoutSpaces() {
        let text = "Hello Beautiful World"
        XCTAssertEqual(text.removingSpaces(), "HelloBeautifulWorld")
    }
}
