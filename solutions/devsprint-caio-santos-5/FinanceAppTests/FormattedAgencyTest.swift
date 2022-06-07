//
//  FormattedAgencyTest.swift
//  FinanceAppTests
//
//  Created by Bruno Vieira Souza on 07/06/22.
//

import XCTest
@testable import FinanceApp

class FormattedAgencyTest: XCTestCase {
    
    private var sut: Account!
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_formattedAgencyTest_WhenGivenAgencyInformation_ShouldFormatCorrectly() {
        sut = Account(agency: "0089", account: "123456-3")
        let formatterAgency = sut.formattedAgency()
        XCTAssertEqual(formatterAgency, "Agency: \(sut.agency)", "falha ao testar formattedAgency, informando uma agencia valida!")
    }
    
    func test_formattedAgencyTest_WhenGivenAnEmptyAgencyInformation_ShouldReturnAFormattedString() {
        sut = Account(agency: "", account: "123456-3")
        let formatterAgency = sut.formattedAgency()
        XCTAssertEqual(formatterAgency, "Agency: ", "falha ao testar formattedAgency, informando uma agencia vazia!")
    }
    
    func test_formattedAgencyTest_multipleBlanksAgencyInformation_ShouldReturnAFormattedString() {
        sut = Account(agency: "         ", account: "123456-3")
        let formatterAgency = sut.formattedAgency()
        XCTAssertEqual(formatterAgency, "Agency:          ", "falha ao testar formattedAgency, informando uma agencia com varios espaços em branco!")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
