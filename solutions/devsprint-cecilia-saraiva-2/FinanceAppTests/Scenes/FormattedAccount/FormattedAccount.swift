//
//  FormattedAccountTests.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 15/08/22.
//

import XCTest
@testable import FinanceApp

final class FormattedAccountTest: XCTestCase {
    
    func test_formattedAccount() {
        let firstAccount = Account(agency: "11111", account: "11111")
        let secondAccount = Account(agency: "22222", account: "22222")
        
        let firstFormattedAccount = firstAccount.formattedAccount()
        let secondFormattedAccount = secondAccount.formattedAccount()
        
        XCTAssertEqual(firstFormattedAccount, "Account: 11111")
        XCTAssertEqual(secondFormattedAccount, "Account: 22222")
    }
}
