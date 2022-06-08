//
//  FormattedAgencyTest.swift
//  FinanceAppTests
//
//  Created by Bruno Vieira Souza on 07/06/22.
//

import XCTest
@testable import FinanceApp

class AccountTest: XCTestCase {
    
    private var sut: Account?
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_formattedAgencyTest_WhenGivenAgencyInformation_ShouldFormatCorrectly() throws {
        // GIVEN
        sut = Account(agency: "0089", account: "123456-3")
        let sut = try XCTUnwrap(sut, "Erro ao configurar SUT")
        
        // WHEN
        let formatterAgency = sut.formattedAgency()

        // THEN
        XCTAssertEqual(formatterAgency, "Agency: \(sut.agency)", "falha ao testar formattedAgency, informando uma agencia valida!")
    }
    
//    func test_formattedAgencyTest_WhenGivenAnEmptyAgencyInformation_ShouldReturnAFormattedString() throws {
//        // GIVEN
//        sut = Account(agency: "", account: "123456-3")
//        let sut = try XCTUnwrap(sut, "Erro ao configurar SUT")
//
//        // WHEN
//        let formatterAgency = sut.formattedAgency()
//            
//        // THEN
//        XCTAssertEqual(formatterAgency, "Agency: ", "falha ao testar formattedAgency, informando uma agencia vazia!")
//    }
    
    func test_formattedAgencyTest_multipleBlanksAgencyInformation_ShouldReturnAFormattedString() throws {
        // GIVEN
        sut = Account(agency: "         ", account: "123456-3")
        let sut = try XCTUnwrap(sut, "Erro ao configurar SUT")

        // WHEN
        let formatterAgency = sut.formattedAgency()
        
        // THEN
        XCTAssertEqual(formatterAgency, "Agency:          ", "falha ao testar formattedAgency, informando uma agencia com varios espaços em branco!")
    }
}
