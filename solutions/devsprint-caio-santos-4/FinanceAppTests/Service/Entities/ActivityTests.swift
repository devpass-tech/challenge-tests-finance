//
//  ActivityTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 07/06/22.
//

import XCTest
@testable import FinanceApp

class ActivityTests: XCTestCase {

    var activity: Activity!

     override func setUpWithError() throws {}

     override func tearDownWithError() throws {}

    func test_formattedInfo_whenFillAllFields_shouldReturnFormattedInfo() {
        // GIVE
        activity = Activity(name: "", price: 100.0, time: "8:57 AM")

        // WHEN
        let info = activity.formattedInfo()

        // THEN
        XCTAssertEqual(info, "$100.0 • 8:57 AM")
    }
    
    func test_formattedInfo_whenPassEmptyStrings_shouldReturnMaskWithoutValues() {
        // GIVE
        activity = Activity(name: "", price: 0, time: "")

        // WHEN
        let info = activity.formattedInfo()

        // THEN
        XCTAssertEqual(info, "$0.0 • ")
    }
    
    // No caso di TIME poder ser NIL
    
//    func test_formattedInfo_whenTimeIsNull_shouldReturnEmpty() {
//        // GIVE
//        activity = Activity(name: "", price: 0, time: nil)
//
//        // WHEN
//        let info = activity.formattedInfo()
//
//        // THEN
//        XCTAssertEqual(info, "")
//    }
}
