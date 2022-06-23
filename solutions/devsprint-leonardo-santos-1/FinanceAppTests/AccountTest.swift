//
//  AccountTest.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 21/06/22.
//

import XCTest
@testable import FinanceApp

class AccountTest: XCTestCase {
    private let sut = Account(agency: "123", account: "456-7")

    func test_formattedAgency_shouldFormatAgency() {
        XCTAssertEqual(sut.formattedAgency(), "Agency: 123")
    }
    
    func testFormattedAcount_WhenDidCall_ShouldReturnAccountString() {
        XCTAssertEqual(sut.formattedAccount(), "Account: 456-7")
    }
}
