//
//  FinanceAppUITests.swift
//  FinanceAppUITests
//
//  Created by Rodrigo Borges on 30/12/21.
//

import XCTest
@testable import FinanceApp

final class FinanceAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
        continueAfterFailure = false
    }

    override func tearDown() {
        app.terminate()
    }
    
    func testHomeToActivityDetailsFlow_WhenClickInTheCell_ShouldNavigateToActivityDetailsView() {
        app = XCUIApplication()
        app.tables.cells.element(boundBy: 0).tap()
        
        let icon = app.images
        let activityNameLabel = app.staticTexts.element(boundBy: 0)
        let categoryLabel = app.staticTexts.element(boundBy: 1)

        XCTAssertEqual(icon.element.exists, true)
        XCTAssertEqual(activityNameLabel.label, "Mall")
        XCTAssertEqual(categoryLabel.label, "Shopping")
    }
}
