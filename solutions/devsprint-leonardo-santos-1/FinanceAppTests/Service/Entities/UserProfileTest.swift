import XCTest

@testable import FinanceApp

final class AccountTest: XCTestCase {
    
    private let sut = Account(agency: "0101", account: "333-3")
    
    func testFormattedAcount_WhenDidCall_ShouldReturnAccountString() {
        XCTAssertEqual(sut.formattedAccount(), "Account: 333-3")
    }
}
