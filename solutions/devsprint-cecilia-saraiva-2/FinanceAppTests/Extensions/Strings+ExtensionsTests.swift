//
//  Strings+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 16/08/22.
//

import XCTest
@testable import FinanceApp

final class StringsExtensionsTests: XCTestCase {

    func testRemovingSpaces() {
        let stringWithSpace = "tes te"
        let stringNoSpace = "teste"
        let stringSpaceInicio = "  teste"
        let stringSpaceFinal = "teste   "
        
        let stringSpace = stringWithSpace.removingSpaces()
        let stringS = stringSpaceInicio.removingSpaces()
        let stringSpa = stringSpaceFinal.removingSpaces()
        
        XCTAssertEqual(stringSpace, stringNoSpace)
        XCTAssertEqual(stringS, stringNoSpace)
        XCTAssertEqual(stringSpa, stringNoSpace)
    }

}
