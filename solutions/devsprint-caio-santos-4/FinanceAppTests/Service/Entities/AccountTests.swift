//
//  AccountTests.swift
//  FinanceAppTests
//
//  Created by Cora on 07/06/22.
//

import XCTest
@testable import FinanceApp

class AccountTests: XCTestCase {
    
    // SUT: System Under Test
    var sut: Account!

    // Luiza
    
    func test_whenInitializeAccount_thenCallFormattedAccountMethod_shouldReturnFormattedAccountInfo() {
        
        //GIVEN:
        sut = Account(agency: "1234", account: "123456-5")
        
        //WHEN:
        let formattedAccount = sut.formattedAccount()
        
        //THEN:
        XCTAssertEqual(formattedAccount, "Account: 123456-5")
    }
    
    // Caio
    
    func test_formattedAccount_whenInitializeWithAccount_shouldReturnFormattedInfo() {
        //GIVEN:
        sut = Account(agency: "1234", account: "123456-5")
        
        //WHEN:
        let formattedAccount = sut.formattedAccount()
        
        //THEN:
        XCTAssertEqual(formattedAccount, "Account: 123456-5")
    }
    
    
    func test_formattedAccount_whenInitializeWithEmptyAccount_shouldReturnFormattedInfo() {
        //GIVEN:
        sut = Account(agency: "1234", account: "")
        
        //WHEN:
        let formattedAccount = sut.formattedAccount()
        
        //THEN:
        XCTAssertEqual(formattedAccount, "Account: ")
    }

}
