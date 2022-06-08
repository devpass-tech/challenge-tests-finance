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
        // Given
        var name = "João José Silva Santana"
        
        // When
        name = name.removingSpaces()
        
        // Then
        XCTAssertEqual(name, "JoãoJoséSilvaSantana")
    }
    
    func test_RemovingSpaces_WhenGivenStringWithoutSpaces_ShouldReturnSameString() {
        // Given
        var string = "umastringsemespaço"
        
        // When
        string = string.removingSpaces()
        
        // Then
        XCTAssertEqual(string, "umastringsemespaço")
    }
    
    func test_RemovingSpaces_WhenGivenOnlySpaces_ShouldReturnEmptyString() {
        // Given
        var spaces = "        "
        
        // When
        spaces = spaces.removingSpaces()
        
        // Then
        XCTAssertEqual(spaces, "")
    }
    
    func test_RemovingSpaces_WhenGivenEmptyString_ShouldReturnEmptyString() {
        // Given
        var empty = ""
        
        // When
        empty = empty.removingSpaces()
        
        // Then
        XCTAssertEqual(empty, "")
    }

}
