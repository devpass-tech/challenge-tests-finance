//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Lucas Pinto on 05/04/22.
//

import XCTest

@testable import FinanceApp

class HomeDataTest: XCTestCase {
    
    var sut: Activity!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Activity(name: "Bob",
                       price: 50.0,
                       time: "20")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_withFilledName_nameRegistration_shouldReturnValidFormat() {
        let name:String = "Bob"
        XCTAssertEqual(name, sut.name)
    }
    
    func test_withFilledName_priceRegistration_shouldReturnValidFormat() {
        let price:Float = 50.0
        XCTAssertEqual(price, sut.price)
    }
    
    func test_withFilledName_timeRegistration_shouldReturnValidFormat() {
        let time:String = "20"
        XCTAssertEqual(time, sut.time)
    }
    
    func test_withFilledActivity_formattedInfoFunction_shoudlReturnNotNil() {
        let formatted = sut.formattedInfo()
        XCTAssertNotNil(formatted)
    }
    
    func test_withFilledActivity_formattedInfoFunction_shoudlReturnValidResult() {
        let formatted = sut.formattedInfo()
        XCTAssertEqual(formatted, "$\(50.0) • \(20)")
    }
}
