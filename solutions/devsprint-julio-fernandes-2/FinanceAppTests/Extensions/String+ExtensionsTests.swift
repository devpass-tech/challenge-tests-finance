//
//  String+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class String_ExtensionsTests: XCTestCase {

    func test_removingSpaces() {
       let shouldRemovingSpaces = "        É um teste"
        XCTAssertEqual("Éumteste", shouldRemovingSpaces.removingSpaces())
    }

}
