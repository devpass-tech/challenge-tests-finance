//
//  ConfirmationTransferViewControllerTesteUI.swift
//  FinanceAppUITests
//
//  Created by Tatiana Rico on 19/05/22.
//

import XCTest

class ConfirmationTransferViewControllerTesteUI: XCTestCase {

    override func setUpWithError() throws {
       try super.setUpWithError()
        XCUIApplication().launch()
        continueAfterFailure = false
    }
    
    func test_ClickBtnConfirmationTransfer_and_showScreenSucesss() {
        let app = XCUIApplication()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Transfers"].tap()
        app.staticTexts["Transfer"].tap()
        
        XCTAssert(app.buttons["Nice!"].exists)
        XCTAssert(app.staticTexts["Your transfer was successful"].exists)
    }
    
    func test_clickTranferInTabBar_ClicBtnChosecontact_and_showScreenListContact() {
        let app = XCUIApplication()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Transfers"].tap()
        app.staticTexts["Choose contact"].tap()
        
        XCTAssert(app.staticTexts["Contact Name"].exists)
    }

}
