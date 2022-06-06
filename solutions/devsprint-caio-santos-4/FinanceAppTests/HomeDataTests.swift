//
//  HomeDataTests.swift
//  FinanceAppTests
//
//  Created by Isabella Bencardino on 06/06/2022.
//

import XCTest
@testable import FinanceApp

class HomeDataTests: XCTestCase {

    var activity: Activity!

     override func setUpWithError() throws {
         activity = Activity(name: "", price: 100.0, time: "8:57 AM")
     }

     override func tearDownWithError() throws {}

    func testFormattedInfo_isCorrect() {
         // WHEN
         let info = activity.formattedInfo()

         // THEN
         XCTAssertEqual(info, "$100.0 • 8:57 AM")
     }
}
