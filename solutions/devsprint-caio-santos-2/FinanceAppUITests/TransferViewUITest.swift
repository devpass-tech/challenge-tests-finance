//
//  TransferViewUITest.swift
//  FinanceAppUITests
//
//  Created by pedro tres on 24/03/22.
//

import XCTest

class TransferViewUITest: XCTestCase {
    
    func test_chooseActivity_ShouldShowTransfersView() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        let transfersButton = tabBar.buttons["Transfers"]
        
        transfersButton.tap()
        let transferButton = app.buttons["Transfer"]
        let chooseContactButton = app.buttons["Choose contact"]
        
        XCTAssert(transferButton.exists)
        XCTAssert(chooseContactButton.exists)
    }
    
    func test_tapNameOnTextField_ShouldBeSuccessfull() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        let transfersButton = tabBar.buttons["Transfers"]
        
        transfersButton.tap()
        
        app.textFields["$0"].tap()
        
        let moreKey = app.keys["letters"]
        moreKey.tap()
        
        app.keys["P"].tap()
        app.keys["e"].tap()
        app.keys["d"].tap()
        app.keys["r"].tap()
        app.keys["o"].tap()
        
        XCTAssert(app.textFields["Pedro"].exists)
    }
    
    func test_tapTransfer_ShouldNavigationToConfirmationViewSuccessfull() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        let transfersButton = tabBar.buttons["Transfers"]
        
        transfersButton.tap()
        
        app.textFields["$0"].tap()
        
        let moreKey = app.keys["letters"]
        moreKey.tap()
        
        app.keys["P"].tap()
        app.keys["e"].tap()
        app.keys["d"].tap()
        app.keys["r"].tap()
        app.keys["o"].tap()
        
        XCTAssert(app.textFields["Pedro"].exists)
        
        let button = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"retorno\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        
        let transfer = app.buttons["Transfer"]
        transfer.tap()
        
        XCTAssert(app.images["SUCESSO"].exists)
        XCTAssert(app.buttons["Nice!"].exists)
        XCTAssert(app.staticTexts["Your transfer was successful"].exists)
    }
}
