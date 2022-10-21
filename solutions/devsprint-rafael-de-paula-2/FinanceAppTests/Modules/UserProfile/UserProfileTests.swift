//
//  UserProfileTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

class UserProfileTests: XCTestCase {
    
    func test_formattedAccount_whenAccountHasValue() {
        let account = Account(agency: "Agency 0001", account: "123456-7")
        let expectedResult = "Account: \(account.account)"
        XCTAssertEqual(account.formattedAccount(), expectedResult)
    }
    
    func test_formattedAccount_whenAccountIsEmpty() {
        let account = Account(agency: "Agency 0001", account: "")
        let expectedResult = "Account: \(account.account)"
        XCTAssertEqual(account.formattedAccount(), expectedResult)
    }
}
