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
        let allElements = app.descendants(matching: .any)
        let activityNameLabel = allElements.staticTexts["Mall"]
        let activityCategoryLabel = allElements.staticTexts["Shopping"]
        let activityPriceLabel = allElements.staticTexts["$100"]
        let activityTimeLabel = allElements.staticTexts["8:57 AM"]
        let activityButton = allElements.buttons["Report a issue"]
        
        XCTAssertTrue(activityIcon.exists)
        XCTAssertTrue(activityNameLabel.exists)
        XCTAssertTrue(activityCategoryLabel.exists)
        XCTAssertTrue(activityPriceLabel.exists)
        XCTAssertTrue(activityTimeLabel.exists)
        XCTAssertTrue(activityButton.exists)
    }
}
