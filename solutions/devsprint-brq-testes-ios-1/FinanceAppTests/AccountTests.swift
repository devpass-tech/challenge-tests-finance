
import XCTest
@testable import FinanceApp

final class AccountTests: XCTestCase {
        
    func test_formattedAccount_shouldReturnCorrectFormattedAccount() {
        let account = Account(agency: "Agency 0007", account: "")
        let result = "Account: \(account.account)"
       
        XCTAssertEqual(account.formattedAccount(), result)
        
    }
}
