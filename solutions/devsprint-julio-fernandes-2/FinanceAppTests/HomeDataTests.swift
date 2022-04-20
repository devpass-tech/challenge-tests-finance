//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 20/04/22.
//

import XCTest
@testable import FinanceApp

class HomeDataTests: XCTestCase {
    
    let activity = Activity(name: "atividade", price: 1000.0, time: "50")
    
    func test_formattedInfo_shouldReturnValidFormat() {
        let formattedStringValue = "$\(1000.0) • \("50")"
        XCTAssertEqual(formattedStringValue, activity.formattedInfo())
    }

    func test_formattedInfo_shouldReturnNotNil() {
        XCTAssertNotNil(activity.formattedInfo())
    }
}
