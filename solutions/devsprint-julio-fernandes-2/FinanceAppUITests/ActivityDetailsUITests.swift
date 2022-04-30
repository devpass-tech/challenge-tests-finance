//
//  ActivityDetailsUITests.swift
//  FinanceAppUITests
//
//  Created by Julio Fernandes on 30/04/22.
//

import XCTest

final class ActivityDetailsUITests: XCTestCase {
    func test_navigation_activityList_to_activityDetails() {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.element(boundBy: 0)
        table.tap()

        let mallLabel = app.staticTexts["Mall"]
        let shoppingLabel = app.staticTexts["Shopping"]

        XCTAssert(mallLabel.exists)
        XCTAssert(shoppingLabel.exists)
    }
}
