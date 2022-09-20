import XCTest
@testable import FinanceApp

final class AccountTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private let sut = Account(agency: "1111", account: "000011")
    
    // MARK: - Methods
    
    func test_formattedAccount_shouldReturnFormattedAccount() {
        
        // When
        let formattedAccount = sut.formattedAccount()
        
        // Then
        XCTAssertEqual(formattedAccount, "Account: \(sut.account)")
    }
}
