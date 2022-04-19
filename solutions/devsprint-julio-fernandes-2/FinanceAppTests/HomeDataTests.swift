//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 19/04/22.
//

import XCTest
@testable import FinanceApp

class HomeDataTests: XCTestCase {
    let activityMock = Activity(name: "atividade", price: 1000, time: "50")
    
    func test_formattedInfo_returnString() {
        let formattedInfo = activityMock.formattedInfo()
        let formattedStringValue = "$\(1000.0) • \("50")"
        XCTAssertEqual(formattedInfo, formattedStringValue)
    }
    
    func test_formattedInfo_returnNotNil() {
        let formattedInfo = activityMock.formattedInfo()
        XCTAssertNotNil(formattedInfo)
    }
}
