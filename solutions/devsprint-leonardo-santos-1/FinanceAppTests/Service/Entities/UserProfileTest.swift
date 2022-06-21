import XCTest

@testable import FinanceApp

final class UserProfileTest: XCTestCase {
    
    private let account = Account(agency: "0101", account: "333-3")
    
    func testFormattedAcount_WhenDidCall_ShouldReturnAccountString() {
        XCTAssertEqual(account.formattedAccount(), "Account: 333-3")
    }
}
