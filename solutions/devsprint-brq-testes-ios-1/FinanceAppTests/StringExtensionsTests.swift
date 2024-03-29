//
//  StringExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

final class StringExtensionsTests: XCTestCase {
    
    private let sut = "Bem Vindo!"

    // MARK: - REMOVE SPACE TEST
    func test_removingSpaces_shouldRemoveSpaces() {
        XCTAssertEqual(sut.removingSpaces(), "BemVindo!")
    }
}

