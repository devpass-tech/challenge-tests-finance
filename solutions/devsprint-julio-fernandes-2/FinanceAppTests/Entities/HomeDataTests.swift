//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 20/04/22.
//

import XCTest
@testable import FinanceApp

final class HomeDataTests: XCTestCase {
    
    private var sut: Activity?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Activity(name: "atividade", price: 1000, time: "50")
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_formattedInfo_shouldReturnValidFormat() {
        let formattedStringValue: String = "$\(1000.0) • \("50")"
        XCTAssertEqual(formattedStringValue, sut?.formattedInfo())
    }

    func test_formattedInfo_shouldReturnNotNil() {
        XCTAssertNotNil(sut?.formattedInfo())
    }
}
