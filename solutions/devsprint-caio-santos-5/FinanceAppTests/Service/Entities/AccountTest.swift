import XCTest
@testable import FinanceApp

final class AccountTest: XCTestCase {
    func test_formattedAgency_WhenGivenAgencyInformation_ShouldFormatCorrectly() throws {
        // GIVEN
        let sut = Account(agency: "0089", account: "123456-3")
        
        // WHEN
        let formatterAgency = sut.formattedAgency()

        // THEN
        XCTAssertEqual(formatterAgency, "Agency: \(sut.agency)")
    }
    
    func test_formattedAgency_WhenGivenAnEmptyAgencyInformation_ShouldReturnAFormattedString() throws {
        // GIVEN
        let sut = Account(agency: "", account: "123456-3")

        // WHEN
        let formatterAgency = sut.formattedAgency()
            
        // THEN
        XCTAssertEqual(formatterAgency, "Agency: ")
    }
    
    func test_formattedAgency_multipleBlanksAgencyInformation_ShouldReturnAFormattedString() throws {
        // GIVEN
        let sut = Account(agency: "         ", account: "123456-3")

        // WHEN
        let formatterAgency = sut.formattedAgency()
        
        // THEN
        XCTAssertEqual(formatterAgency, "Agency:          ")
    }
    
    func test_formattedAccount_WhenGivenAgencyInformation_ShouldFormatCorrectly() throws {
        // GIVEN
        let sut = Account(agency: "dummy", account: "123456-3")
        
        // WHEN
        let formatterAgency = sut.formattedAccount()
        
        // THEN
        XCTAssertEqual(formatterAgency, "Account: 123456-3")
    }
    
    func test_formattedAccount_WhenGivenAnEmptyAgencyInformation_ShouldReturnAFormattedString() throws {
        // GIVEN
        let sut = Account(agency: "dummy", account: "")
        
        // WHEN
        let formatterAgency = sut.formattedAccount()
        
        // THEN
        XCTAssertEqual(formatterAgency, "Account: ")
    }
    
    func test_formattedAccount_multipleBlanksAgencyInformation_ShouldReturnAFormattedString() throws {
        // GIVEN
        let sut = Account(agency: "dummy", account: "         ")
        
        // WHEN
        let formatterAgency = sut.formattedAccount()
        
        // THEN
        XCTAssertEqual(formatterAgency, ("Account:          ")
    }
}
