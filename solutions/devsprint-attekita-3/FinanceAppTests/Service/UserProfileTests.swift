//
//  HomeDataTest.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 17/05/22.
//

import XCTest
@testable import FinanceApp

final class UserProfileTests: XCTestCase {
    private var sut: Account!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAccountStruct_formattedAccountMethod_WhenGivenAnEmptyAccountInformation_ShouldReturnAFormattedString() {
        sut = Account(agency: "031", account: "")
        let formattedAcountInfo = sut.formattedAccount()
        
        XCTAssertEqual(formattedAcountInfo, "Account: ", "fails because formattedAcountInfo its not equal to 'Account: '")
    }
    
    func testAccountStruct_formattedAccountMethod_WhenGivenAccountInformation_ShouldFormatCorrectly() {
        sut = Account(agency: "031", account: "9281057193")
        let formattedAcountInfo = sut.formattedAccount()
        
        XCTAssertEqual(formattedAcountInfo, "Account: \(sut.account)", "fails because formattedAcountInfo its not equal to 'Account: 9281057193'")
    }

}
