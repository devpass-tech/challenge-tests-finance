//
//  ActivityDetailsTests.swift
//  FinanceAppUITests
//
//  Created by Thiago Cezario on 25/08/22.
//

import XCTest

final class ActivityDetailsUITests: XCTestCase {
    let app: XCUIApplication = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func tapOnActivityCell() {
        let tableView = app.tables["ActivityTableView"]
        let cell = tableView.cells["ActivityCellView0"]
        cell.tap()
    }
    
    func testNavigateToActivityDetails() throws {
        tapOnActivityCell()
        XCTAssert(app.otherElements["ActivityDetailsView"].exists)
        XCTAssert(app.buttons["ReportAnIssueButton"].exists)
    }
    
    func testNavigationBackFromActivityDetails() throws {
        tapOnActivityCell()
        let backButton = app.navigationBars["FinanceApp.ActivityDetailsView"].buttons["Back"]
        backButton.tap()
        
        XCTAssert(app.otherElements["HomeView"].exists)
        XCTAssert(app.tables["ActivityTableView"].exists)
    }
}
