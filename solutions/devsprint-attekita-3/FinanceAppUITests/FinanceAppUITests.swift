//
//  FinanceAppUITests.swift
//  FinanceAppUITests
//
//  Created by Rodrigo Borges on 30/12/21.
//

import XCTest
@testable import FinanceApp

final class FinanceAppUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var activityDetailsTable: XCUIElement!
    private var activityDetailsIcon: XCUIElement!
    private var activityDetailsNameLabel: XCUIElement!
    private var activityDetailsCategoryLabel: XCUIElement!
    private var activityDetailsPriceLabel: XCUIElement!
    private var activityDetailsTimeLabel: XCUIElement!
    private var activityDetailsReportButton: XCUIElement!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        
        activityDetailsTable = app.tables.cells.element(boundBy: 0)
        activityDetailsIcon = app.images["ActivityDetailsIconImage"]
        activityDetailsNameLabel = app.staticTexts["ActivityDetailsNameLabel"]
        activityDetailsCategoryLabel = app.staticTexts["ActivityDetailsCategoryLabel"]
        activityDetailsPriceLabel = app.staticTexts["ActivityDetailsPriceLabel"]
        activityDetailsTimeLabel = app.staticTexts["ActivityDetailsTimeLabel"]
        activityDetailsReportButton = app.buttons["ActivityDetailsReportButton"]
        
        continueAfterFailure = false
    }

    override func tearDown() {
        activityDetailsTable = nil
        activityDetailsIcon = nil
        activityDetailsNameLabel = nil
        activityDetailsCategoryLabel = nil
        activityDetailsPriceLabel = nil
        activityDetailsTimeLabel = nil
        activityDetailsReportButton = nil
        app.terminate()
    }
    
    func testHomeToActivityDetailsFlow_WhenClickInTheCell_ShouldNavigateToActivityDetailsView() {
        activityDetailsTable.tap()

        XCTAssertEqual(activityDetailsIcon.exists, true, "fails because activityDetailsIcon does not exists")
        XCTAssertEqual(activityDetailsNameLabel.label, "Mall", "fails because activityDetailsNameLabel its not equal to expected value")
        XCTAssertEqual(activityDetailsCategoryLabel.label, "Shopping", "fails because activityDetailsCategoryLabel its not equal to expected value")
        XCTAssertEqual(activityDetailsPriceLabel.label, "$100", "fails because activityDetailsPriceLabel its not equal to expected value")
        XCTAssertEqual(activityDetailsTimeLabel.label, "8:57 AM", "fails because activityDetailsTimeLabel its not equal to expected value")
        XCTAssertEqual(activityDetailsReportButton.exists, true, "fails because activityDetailsReportButton does not exists")
    }
}
