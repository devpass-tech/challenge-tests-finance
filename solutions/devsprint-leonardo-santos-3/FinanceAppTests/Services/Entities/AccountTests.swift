import XCTest
@testable import FinanceApp

final class AccountTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private let sut = Account(agency: "1111", account: "000011")
    
    // MARK: - Methods
    
    func test_formattedAccount_shouldReturnFormattedAccount() {
        
        // When
        let expectedFormattedAccount = sut.formattedAccount()
        
        // Then
        XCTAssertEqual(expectedFormattedAccount, "Account: \(sut.account)")
    }
    
    func test_formattedAgency_thenReturnAgencyFormatted() {
        
        //when
        let expectedFormattedAgency = sut.formattedAgency()
        
        //then
        XCTAssertEqual(expectedFormattedAgency, "Agency: \(sut.agency)")
    }
}
