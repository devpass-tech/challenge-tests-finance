//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

class HomeDataTests: XCTestCase {
    
    func test_formattedInfo_whenActivityHasData_shouldRetrunsFormattedString() {
        let activity = Activity(name: "Person", price: 300, time: "13/12/2022 - 12:00")
        let expectedResult = "$\(activity.price) • \(activity.time)"
        XCTAssertEqual(activity.formattedInfo(), expectedResult)
    }
    
    func test_formattedInfo_whenPriceZeroAndTimeAreEmpty_shouldRetrunsFormattedString() {
        let activity = Activity(name: "Person", price: 0, time: "")
        let expectedResult = "$\(activity.price) • \(activity.time)"
        XCTAssertEqual(activity.formattedInfo(), expectedResult)
    }
}
