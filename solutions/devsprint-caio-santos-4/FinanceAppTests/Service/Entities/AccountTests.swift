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
    var sut: Account?
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // Luiza
    
    func test_whenInitializeAccount_thenCallFormattedAccountMethod_shouldReturnFormattedAccountInfo() throws {
        
        //GIVEN:
        sut = Account(agency: "1234", account: "123456-5")
        let validSUT = try XCTUnwrap(sut, "SUT not initialized")
        
        //WHEN:
        let formattedAccount = validSUT.formattedAccount()
        
        //THEN:
        XCTAssertEqual(formattedAccount, "Account: 123456-5")
    }
    
    // Mari
    
    func test_formattedAgency_whenFillAllFields_shoulReturnFormattedAgency() throws {
        sut = Account(agency: "1234", account: "123456-5")
        let validSUT = try XCTUnwrap(sut, "SUT not initialized")
        let formattedAgency = validSUT.formattedAgency()
        XCTAssertEqual(formattedAgency, "Agency: 1234")
    }

    func test_formattedAgency_whenInitializeEmpty_shouldReturnFormattedAgency() throws {
        sut = Account(agency: "", account: "123456-5")
        let validSUT = try XCTUnwrap(sut, "SUT not initialized")
        let formattedAgency = validSUT.formattedAgency()
        XCTAssertEqual(formattedAgency, "Agency: ")
    }

    // Caio

    func test_formattedAccount_whenInitializeWithAccount_shouldReturnFormattedInfo() throws {
        //GIVEN:
        sut = Account(agency: "1234", account: "123456-5")
        let validSUT = try XCTUnwrap(sut, "SUT not initialized")

        //WHEN:
        let formattedAccount = validSUT.formattedAccount()

        //THEN:
        XCTAssertEqual(formattedAccount, "Account: 123456-5")
    }


    func test_formattedAccount_whenInitializeWithEmptyAccount_shouldReturnFormattedInfo() throws {
        //GIVEN:
        sut = Account(agency: "1234", account: "")
        let validSUT = try XCTUnwrap(sut, "SUT not initialized")

        //WHEN:
        let formattedAccount = validSUT.formattedAccount()

        //THEN:
        XCTAssertEqual(formattedAccount, "Account: ")
    }

}
