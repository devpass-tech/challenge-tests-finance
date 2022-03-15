//
//  UserProfileTests.swift
//  FinanceAppTests
//
//  Created by Thiago Henrique Alves Ferreira on 14/03/22.
//

import XCTest
@testable import FinanceApp

class UserProfileTests: XCTestCase {
    
    var sut: UserProfile!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let account = Account(agency: "7543",
                              account: "0001578741")
        
        sut = UserProfile(name: "Thiago Ferreira",
                              phone: "(11) 99999-9999",
                              email: "test@email.com",
                              address: "Rua A, 123 - Bairro B - Cidade de C",
                              account: account)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testFormattedAgencyValid() {
        let expectedAgency = "Agency: 7543"
        XCTAssertEqual(expectedAgency, sut.account.formattedAgency())
    }
    
    func testFormattedAgencyInvalid() {
        let expectedAgency = "7543"
        XCTAssertNotEqual(expectedAgency, sut.account.formattedAgency())
    }
    
    func testFormattedAgencyContainsWordPrefix() {
        let prefix = "Agency"
        XCTAssertTrue(sut.account.formattedAgency().contains(prefix))
    }
    
    func testFormattedAgencyNotContainsIncorrectPrefix() {
        let prefix = "agency"
        XCTAssertFalse(sut.account.formattedAgency().contains(prefix))
    }
    
    func testFormattedAgencyIsNotEmpty() {
        XCTAssertFalse(sut.account.formattedAgency().isEmpty)
    }
    
    func testFormattedAgencyReturnString() {
        let typeOfReturn = type(of: sut.account.formattedAgency())
        XCTAssertTrue(typeOfReturn == String.self)
    }
}
