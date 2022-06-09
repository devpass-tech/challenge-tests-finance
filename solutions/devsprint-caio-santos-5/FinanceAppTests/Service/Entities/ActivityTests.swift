//
//  ActivityTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Francischett Occhiuto on 08/06/22.
//

import XCTest
@testable import FinanceApp

class ActivityTests: XCTestCase {
    private var sut: Activity?
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_formattedInfo_WhenGivenActivityInformation_ShouldFormatCorrectly() throws {
        // GIVEN
        sut = Activity(name: "Farmácia", price: 50.0, time: "20")
        let sut = try XCTUnwrap(sut, "Erro ao configurar SUT")
        
        // WHEN
        let formatterInfo = sut.formattedInfo()

        // THEN
        XCTAssertEqual(formatterInfo, "$50.0 • 20")
    }
    
    func test_formattedInfo_WhenGivenActivityInformation_ShouldReturnNotNill() throws {
        // GIVEN
        sut = Activity(name: "Farmácia",price: 50.0, time: "20")
        let sut = try XCTUnwrap(sut, "Erro ao configurar SUT")
        
        let formatterInfo = sut.formattedInfo() as String
        
        // THEN
        XCTAssertNotNil(formatterInfo, String())
    }
    
    func test_formattedInfo_WhenGivenEmptyActivityInformation_ShouldReturnEmpty() throws {
        // GIVEN
        sut = Activity(name: "", price: 0.0, time: "")
        let sut = try XCTUnwrap(sut, "Erro ao configurar SUT")
        
        // WHEN
        let formatterInfo = sut.formattedInfo()

        // THEN
        XCTAssertEqual(formatterInfo, "$0.0 • ")
    }
    
    
    
    
}
