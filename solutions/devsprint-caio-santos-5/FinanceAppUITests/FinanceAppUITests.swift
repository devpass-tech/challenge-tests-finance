import XCTest

final class FinanceAppUITests: XCTestCase {
    func testConfirmation() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["transfersTabBar"].tap()
        app.buttons["transferButton"].tap()
        
        XCTAssert(app.images["confirmationImageView"].exists)
        XCTAssert(app.staticTexts["confirmationLabel"].exists)
        let button = app.buttons["confirmationButton"]
        XCTAssert(button.exists)
        
        button.tap()
        
        XCTAssertFalse(app.otherElements["ConfirmationView"].exists)
    }
}
