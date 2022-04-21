//
//  UserProfileTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 20/04/22.
//

import XCTest
@testable import FinanceApp

final class UserProfileTests: XCTestCase {
    var sut: UserProfile?

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = UserProfile(
            name: "Paulo Henrique Silva",
            phone: "(81) 998904067",
            email: "psilva@gmail.com",
            address: "Rua São João",
            account: Account(agency: "9345", account: "0023519034")
        )
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_formattedAgency_filledAgency_shouldReturnValidFormat() {
        let formattedAgency: String = "Agency: 9345"
        if let value = sut {
            XCTAssertEqual(formattedAgency, value.account.formattedAgency())
        }
    }
    
    func test_formattedAgency_filledAgency_shouldHaveAgencyPrefix() {
        let formattedAgency: String = "Agency"
        if let value = sut {
            XCTAssertTrue(value.account.formattedAgency().hasPrefix(formattedAgency))
        }
    }
    
    func test_formattedAgency_filledAgency_shouldNotHaveAgencyPrefix() {
        let formattedAgency: String = "Agencia"
        if let value = sut {
            XCTAssertFalse(value.account.formattedAgency().hasPrefix(formattedAgency))
        }
    }
    
    func test_formattedAgency_invalidAgency_shouldReturnNotValidFormat() {
        let formattedAgency: String = "9345"
        if let value = sut {
            XCTAssertNotEqual(formattedAgency, value.account.formattedAgency())
        }
    }
    
    func test_formattedAgency_shouldReturnNotNil() {
        if let value = sut {
            XCTAssertNotNil(value.account.formattedAgency())
        }
    }
    
    func test_formattedAgency_filledAgency_shouldReturnString() {
        if let value = sut {
            XCTAssertTrue(type(of: value.account.formattedAgency()) == String.self)
        }
    }
}
