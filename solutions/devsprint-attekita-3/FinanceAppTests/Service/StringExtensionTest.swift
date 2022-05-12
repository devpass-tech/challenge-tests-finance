//
// StringExtensionTest.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 12/05/22.
//
import XCTest
@testable import FinanceApp

class StringExtensionTest: XCTestCase {

    func test_remove_space_String_Text_dont_have_Space() {
        let textOneSpace = "Dia Lindo"
        let textTwoSpace = "Dia a dia"
        let text2TwoSpace = "Algo  Aconteceu"
        
        XCTAssertEqual(textOneSpace.removingSpaces(), "DiaLindo")
        XCTAssertEqual(textTwoSpace.removingSpaces(), "Diaadia")
        XCTAssertEqual(text2TwoSpace.removingSpaces(), "AlgoAconteceu")
    }

}

