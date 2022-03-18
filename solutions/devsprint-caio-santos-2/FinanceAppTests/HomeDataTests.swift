//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 16/03/22.
//

import XCTest

@testable import FinanceApp

class HomeDataTest: XCTestCase {
  
    func test_formattedInfo_returnStringValue(){
        let activityMock = Activity(name: "teste", price: 100, time: "30")
        let formatter = activityMock.formattedInfo()
        XCTAssertEqual(formatter,"$\(100.0) • \("30")")
    }
    
    func test_formattedInfo_returnNotNil() {
        let activityMock = Activity(name: "teste", price: 100, time: "30")
        let formatter = activityMock.formattedInfo()
        XCTAssertNotNil(formatter)
    }
}
