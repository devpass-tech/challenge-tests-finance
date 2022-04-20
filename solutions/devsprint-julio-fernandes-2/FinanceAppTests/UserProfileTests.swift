//
//  UserProfileTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 20/04/22.
//

import XCTest
@testable import FinanceApp

class UserProfileTests: XCTestCase {
    var sut: UserProfile!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let account = Account(agency: "9345", account: "0023519034")
        
        sut = UserProfile(name: "Paulo Henrique Silva", phone: "(81) 998904067", email: "psilva@gmail.com", address: "Rua São João", account: account)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_formattedAgency_filledAgency_shouldReturnValidFormat() {
        let formattedAgency = "Agency: 9345"
        XCTAssertEqual(formattedAgency, sut.account.formattedAgency())
    }
    
    func test_formattedAgency_filledAgency_shouldHasAgencyPrefix() {
        let formattedAgency = "Agency"
        XCTAssertTrue(sut.account.formattedAgency().hasPrefix(formattedAgency))
    }
    
    func test_formattedAgency_filledAgency_shouldNotAgencyPrefix() {
        let formattedAgency = "Agencia"
        XCTAssertFalse(sut.account.formattedAgency().hasPrefix(formattedAgency))
    }
    
    func test_formattedAgency_invalidAgency_shouldReturnNotValidFormat() {
        let formattedAgency = "9345"
        XCTAssertNotEqual(formattedAgency, sut.account.formattedAgency())
    }
    
    func test_formattedAgency_shouldReturnNotNil() {
        XCTAssertNotNil(sut.account.formattedAgency())
    }
    
    func test_formattedAgency_filledAgency_shouldReturnString() {
        XCTAssertTrue(type(of: sut.account.formattedAgency()) == String.self)
    }
}
