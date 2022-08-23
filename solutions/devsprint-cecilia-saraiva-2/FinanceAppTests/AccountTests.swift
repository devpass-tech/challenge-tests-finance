//
//  AccountTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 23/08/22.
//

import XCTest
@testable import FinanceApp

class AccountTests: XCTestCase {

    func testFormattedAgency() {
        
        let account = Account(agency: "1", account: "")
        
        let formattedAgency = account.formattedAgency()
        
        let test = "Agency: 1"
        
        XCTAssertEqual(formattedAgency, test)
    }

}

