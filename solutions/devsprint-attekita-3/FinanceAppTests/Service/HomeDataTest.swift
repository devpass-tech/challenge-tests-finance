//
//  HomeDataTest.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 13/05/22.
//

import XCTest
@testable import FinanceApp

class HomeDataTest: XCTestCase {
   private var sut: Activity?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Activity(name: "Mercado", price: 500, time: "60")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func test_formattedInfo_shouldReturnValidFormat() {
        let formattedStringValue: String = "$\(500.0) • \("60")"
        XCTAssertEqual(formattedStringValue, sut?.formattedInfo())
    }
    
    func test_formattedInfo_shouldReturnNotNil() {
        XCTAssertNotNil(sut?.formattedInfo())
    }
    
    func test_formattedInfo_shouldReturnEmpty() {
        let formattedStringValue = Activity(name: "", price: 0.0, time: "")
        
        XCTAssertEqual(formattedStringValue.formattedInfo(), "$0.0 • ")
    }
}
