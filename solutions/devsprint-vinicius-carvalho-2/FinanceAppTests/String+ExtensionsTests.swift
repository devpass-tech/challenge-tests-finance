//
//  String+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Guilherme Strutzki on 05/04/22.
//

import XCTest
@testable import FinanceApp

class String_ExtensionsTests: XCTestCase {

    func test_removingSpaces_removeBlankSpaces() {
        let string = "Lorem ipsum dolar sit"
        XCTAssertEqual(string.removingSpaces(), "Loremipsumdolarsit")
    }
}
