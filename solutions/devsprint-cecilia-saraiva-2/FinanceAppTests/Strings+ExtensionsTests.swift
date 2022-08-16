//
//  Strings+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 16/08/22.
//

import XCTest
@testable import FinanceApp

class Strings_ExtensionsTests: XCTestCase {

    func testRemovingSpaces() {
        let stringWithSpace = "tes te"
        let stringNoSpace = "teste"
        
        let stringSpace = stringWithSpace.removingSpaces()
        
        XCTAssertEqual(stringSpace, stringNoSpace)
    }

}
