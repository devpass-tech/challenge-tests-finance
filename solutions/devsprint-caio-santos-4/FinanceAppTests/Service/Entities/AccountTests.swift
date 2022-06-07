//
//  AccountTests.swift
//  FinanceAppTests
//
//  Created by Cora on 07/06/22.
//

import XCTest
@testable import FinanceApp

class AccountTests: XCTestCase {

    func test_whenInitializeAccount_thenCallFormattedAccountMethod_shouldReturnFormattedAccountInfo() {
        
        //GIVEN:
        var sut: Account = Account(agency: "1234", account: "123456-5")
        
        //WHEN:
        var formattedAccount = sut.formattedAccount()
        
        //THEN:
        XCTAssertEqual(formattedAccount, "Account: 123456-5")
    }
}
