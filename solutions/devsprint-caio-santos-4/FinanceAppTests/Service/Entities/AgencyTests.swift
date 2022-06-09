//
//  AgencyTests.swift
//  FinanceAppTests
//
//  Created by Cora on 08/06/22.
//

import XCTest
@testable import FinanceApp

class AgencyTests: XCTestCase {
    var sut: Account!
    
    func test_formattedAgency_whenFillAllFields_shoulReturnFormattedAgency() {
        sut = Account(agency: "1234", account: "123456-5")
        let formattedAgency = sut.formattedAgency()
        XCTAssertEqual(formattedAgency, "Agency: 1234")
    }
    
    func test_formattedAgency_whenInitializeEmpty_shouldReturnFormattedAgency()
    {
        sut = Account(agency: "", account: "123456-5")
        let formattedAgency = sut.formattedAgency()
        XCTAssertEqual(formattedAgency, "Agency: ")
    }}
