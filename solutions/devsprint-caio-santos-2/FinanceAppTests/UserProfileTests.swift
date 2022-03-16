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

//    test_[O QUE VAMOS TESTAR]_[O QUE VAMOS PASSAR]_[O QUE DEVE ACONTECER]
    func test_formattedAgency_withFilledAgency_shouldReturnValidFormat() {
        let expectedAgency = "Agency: 7543"
        XCTAssertEqual(expectedAgency, sut.account.formattedAgency())
    }
    
    func test_formattedAgency_withInvalidExpectedAgency_shouldNotEqualFormat() {
        let expectedAgency = "7543"
        XCTAssertNotEqual(expectedAgency, sut.account.formattedAgency())
    }
    
    func test_formattedAgency_withFilledAgency_shouldHasPrefix() {
        let prefix = "Agency"
        XCTAssertTrue(sut.account.formattedAgency().contains(prefix))
    }
    
    func test_formattedAgency_withFilledAgency_shouldHasNotPrefix() {
        let prefix = "agency"
        XCTAssertFalse(sut.account.formattedAgency().contains(prefix))
    }
    
    func test_formattedAgency_withFilledAgency_shouldNotEmpty() {
        XCTAssertFalse(sut.account.formattedAgency().isEmpty)
    }
    
    func test_formattedAgency_withFilledAgency_shouldReturnString() {
        let typeOfReturn = type(of: sut.account.formattedAgency())
        XCTAssertTrue(typeOfReturn == String.self)
    }
}
