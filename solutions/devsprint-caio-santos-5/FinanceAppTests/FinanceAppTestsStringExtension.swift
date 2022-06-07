//
//  FinanceAppTestsStringExtension.swift
//  FinanceAppTests
//
//  Created by Hyago Henrique on 06/06/22.
//

import XCTest
@testable import FinanceApp

class FinanceAppTestsStringExtension: XCTestCase {
    
    func test_RemovingSpaces_WhenGivesFullName_ShouldReturnFullNameWithoutSpaces() {
        var name = "João José Silva Santana"
        name = name.removingSpaces()
        XCTAssertEqual(name, "JoãoJoséSilvaSantana")
    }
    
    func test_RemovingSpaces_WhenGivenStringWithoutSpaces_ShouldReturnSameString() {
        var string = "umastringsemespaço"
        string = string.removingSpaces()
        XCTAssertEqual(string, "umastringsemespaço")
    }
    
    func test_RemovingSpaces_WhenGivenOnlySpaces_ShouldReturnEmptyString() {
        var spaces = "        "
        spaces = spaces.removingSpaces()
        XCTAssertEqual(spaces, "")
    }
    
    func test_RemovingSpaces_WhenGivenEmptyString_ShouldReturnEmptyString() {
        var empty = ""
        empty = empty.removingSpaces()
        XCTAssertEqual(empty, "")
    }

}
