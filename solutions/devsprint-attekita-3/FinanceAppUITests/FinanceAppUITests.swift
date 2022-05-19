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
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDown() {
        app.terminate()
    }
    
    func testHomeToActivityDetailsFlow_WhenClickInTheCell_ShouldNavigateToActivityDetailsView() {
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        let activityIcon = app.images.element(boundBy: 0)
        let activityNameLabel = app.staticTexts["Mall"]
        let activityCategoryLabel = app.staticTexts["Shopping"]
        let activityPriceLabel = app.staticTexts["$100"]
        let activityTimeLabel = app.staticTexts["8:57 AM"]
        let activityButton = app.buttons["Report a issue"]
        
        XCTAssertTrue(activityIcon.exists)
        XCTAssertTrue(activityNameLabel.exists)
        XCTAssertTrue(activityCategoryLabel.exists)
        XCTAssertTrue(activityPriceLabel.exists)
        XCTAssertTrue(activityTimeLabel.exists)
        XCTAssertTrue(activityButton.exists)
    }
}
