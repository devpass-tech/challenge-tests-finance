//
//  UserProfileTest.swift
//  FinanceAppTests
//
//  Created by Lucas Pinto on 07/04/22.
//

import XCTest

@testable import FinanceApp

class FormattedAgencyTest: XCTestCase {
    
    var sut: UserProfile!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let account = Account(agency: "0001", account: "123456789")
        
        sut = UserProfile(name: "Bob",
                          phone: "12345678",
                          email: "bob@email.com",
                          address: "Rua Silva, Bairro 1",
                          account: account)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_formattedAgency_withInserteAgencydData_shouldNotNil() {
        XCTAssertTrue(!sut.account.formattedAgency().isEmpty)
    }
    
    func test_formattedAgency_withInserteAgencydData_shouldReturnTypeString(){
        XCTAssert((sut.account.formattedAgency() as Any) is String)
    }
    
    func test_formattedAgency_withInserteAgencydData_shouldReturnCorrectResult(){
        XCTAssertEqual(sut.account.formattedAgency(), "Agency: 0001")
    }
}
