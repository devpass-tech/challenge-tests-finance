//
//  FinanceAppUITests.swift
//  FinanceAppUITests
//
//  Created by Rodrigo Borges on 30/12/21.
//

import XCTest

class FinanceAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    fileprivate func performLogin(_ app: XCUIApplication) {
        app.textFields["Email"].tap()
        "Teste@teste.com".forEach { char in
            app.keys["\(char)"].tap()
        }
        
        app.secureTextFields["Password"].tap()
        app.keys["numbers"].tap()
        
        "1111".forEach { char in
            app.keys["\(char)"].tap()
        }
        
        
        app.buttons["Return"].tap()
        app.buttons["Login"].tap()
    }
    
    func test_chooseContact_findAnnetteCooper_ShouldBeSuccessfull() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        performLogin(app)
        

        let tabBar = app.tabBars["Tab Bar"]
        let transfersButton = tabBar.buttons["Transfers"]

        transfersButton.tap()
        let transferButton = app.buttons["Transfer"]
        let chooseContactButton = app.buttons["Choose contact"]

        XCTAssert(transferButton.exists)
        XCTAssert(chooseContactButton.exists)

        chooseContactButton.tap()

        let contactName = app.staticTexts["Annette Cooper"]
        XCTAssert(contactName.waitForExistence(timeout: 5))
    }
    
    func test_chooseActivity_findFirstCell_ShouldShowActivityDetails() throws {
        let app = XCUIApplication()
        app.launch()
        
        performLogin(app)
        
        XCTAssert(app.staticTexts["Mall"].exists)
                
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Mall"].tap()
        
        XCTAssert(app.buttons["Report a issue"].exists)
        XCTAssert(app.staticTexts["Mall"].exists)
        XCTAssert(app.staticTexts["Shopping"].exists)
        XCTAssert(app.staticTexts["$100"].exists)
        XCTAssert(app.staticTexts["8:57 AM"].exists)
    }
    
    func test_transfer_tapNameOnTextField_ShouldBeSuccessfull() throws {
        let app = XCUIApplication()
        app.launch()
        
        performLogin(app)
        
        let tabBar = app.tabBars["Tab Bar"]
        let transfersButton = tabBar.buttons["Transfers"]

        transfersButton.tap()

        app.textFields["$0"].tap()
        
        let moreKey = app.keys["letters"]
        moreKey.tap()
        
        app.keys["C"].tap()
        app.keys["a"].tap()
        app.keys["i"].tap()
        app.keys["o"].tap()
        
        XCTAssert(app.textFields["Caio"].exists)
    }
    
    func test_transfer_tapTransfetButton_ShouldShowSuccessFeedback() throws {
        let app = XCUIApplication()
        app.launch()
        
        performLogin(app)
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Transfers"].tap()
        app.buttons["Transfer"].tap()
        
        XCTAssert(app.images["SUCESSO"].exists)
        XCTAssert(app.staticTexts["Your transfer was successful"].exists)
    }
}
