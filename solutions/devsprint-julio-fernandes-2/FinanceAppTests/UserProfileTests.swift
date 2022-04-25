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
    
    func test_formattedAgency_filledAgency_shouldReturnValidFormat() throws {
        let formattedAgency: String = "Agency: 9345"
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(formattedAgency, sut.account.formattedAgency())
    }
    
    func test_formattedAgency_filledAgency_shouldHaveAgencyPrefix() throws {
        let formattedAgency: String = "Agency"
        let sut = try XCTUnwrap(sut)
        XCTAssertTrue(sut.account.formattedAgency().hasPrefix(formattedAgency))
    }
    
    func test_formattedAgency_filledAgency_shouldNotHaveAgencyPrefix() throws {
        let formattedAgency: String = "Agencia"
        let sut = try XCTUnwrap(sut)
        XCTAssertFalse(sut.account.formattedAgency().hasPrefix(formattedAgency))
    }
    
    func test_formattedAgency_invalidAgency_shouldReturnNotValidFormat() throws {
        let formattedAgency: String = "9345"
        let sut = try XCTUnwrap(sut)
        XCTAssertNotEqual(formattedAgency, sut.account.formattedAgency())
    }
    
    func test_formattedAgency_shouldReturnNotNil() throws {
        let sut = try XCTUnwrap(sut)
        XCTAssertNotNil(sut.account.formattedAgency())
    }
    
    func test_formattedAgency_filledAgency_shouldReturnString() throws {
        let sut = try XCTUnwrap(sut)
        XCTAssertTrue(type(of: sut.account.formattedAgency()) == String.self)
    }
}
