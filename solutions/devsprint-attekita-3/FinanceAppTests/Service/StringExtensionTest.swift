//
// StringExtensionTest.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 12/05/22.
//
import XCTest
@testable import FinanceApp

class StringExtensionTest: XCTestCase {

    func test_removeSpaceString_ShouldRemoveTextSpaces() {
        let textOneSpace = "Dia Lindo"
        let textTwoSpace = "Dia a dia"
        let text2TwoSpace = "Algo  Aconteceu"
        let textLongSpace = "long              space"
        let text = ""
        let textSpace = " Work,  work, work  "
        
        XCTAssertEqual(textOneSpace.removingSpaces(), "DiaLindo")
        XCTAssertEqual(textTwoSpace.removingSpaces(), "Diaadia")
        XCTAssertEqual(text2TwoSpace.removingSpaces(), "AlgoAconteceu")
        XCTAssertEqual(text.removingSpaces(), "")
        XCTAssertEqual(textLongSpace.removingSpaces(), "longspace")
        XCTAssertEqual(textSpace.removingSpaces(), "Work,work,work")
    }

}

