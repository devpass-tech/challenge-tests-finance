//
//  ProfileUITests.swift
//  FinanceAppUITests
//
//  Created by Pedro Henrique Martins Barbosa on 27/04/22.
//

import XCTest

class ProfileUITests: XCTestCase {
    func test_navigation_home_to_profile() {
        let app = XCUIApplication()
        app.launch()
        
        let navigationBar = app.navigationBars["FinanceApp.HomeView"]
        navigationBar.buttons["Profile"].tap()
        
        let userName = app.staticTexts["User Name"]
        let agency = app.staticTexts["Agency 0001"]
        let account = app.staticTexts["Account 123456-7"]
        let bankName = app.staticTexts["Devpass Bank"]
        
        XCTAssert(userName.exists)
        XCTAssert(agency.exists)
        XCTAssert(account.exists)
        XCTAssert(bankName.exists)
    }
}
