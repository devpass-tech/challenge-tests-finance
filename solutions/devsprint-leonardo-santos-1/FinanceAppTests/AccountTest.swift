//
//  AccountTest.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 21/06/22.
//

import XCTest
@testable import FinanceApp

class AccountTest: XCTestCase {

    func test_formattedAgency_shouldFormatAgency() {
        let account = Account(agency: "123", account: "4567")
        XCTAssertEqual(account.formattedAgency(), "Agency: 123")
    }
}
