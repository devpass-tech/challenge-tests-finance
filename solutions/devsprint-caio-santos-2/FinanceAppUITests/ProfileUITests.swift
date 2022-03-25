import XCTest

class ProfileUITests: XCTestCase {

    func test_navigation_to_ProfileScreen() throws {
        let app = XCUIApplication()
        app.launch()
        
        let navigationBar = app.navigationBars["FinanceApp.HomeView"]
        let profileButton = navigationBar.buttons["Profile"]
        
        profileButton.tap()
        
        let userName = app.staticTexts["User Name"]
        let bankName = app.staticTexts["Devpass Bank"]
        XCTAssert(userName.exists)
        XCTAssert(bankName.exists)
    }

}
