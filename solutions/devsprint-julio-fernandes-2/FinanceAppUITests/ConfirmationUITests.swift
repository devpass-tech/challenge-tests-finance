//
//  ConfirmationUITests.swift
//  FinanceAppUITests
//
//  Created by Pedro Henrique Martins Barbosa on 27/04/22.
//

import XCTest

final class ConfirmationUITests: XCTestCase {
    func test_navigation_transfers_to_confirmation() {
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Transfers"].tap()

        let transferButton = app.buttons["Transfer"]
        transferButton.tap()

        let confirmationLabel = app.staticTexts["Your transfer was successful"]
        let niceButton = XCUIApplication().buttons["Nice!"]

        XCTAssert(confirmationLabel.exists)
        XCTAssert(niceButton.exists)
    }
}
