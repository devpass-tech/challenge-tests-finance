import XCTest
@testable import FinanceApp

final class RemoteConfigProviderTests: XCTestCase {
    
    private let sut = RemoteConfigProvider()
    
    func test_shouldExecute_givenDefaultProfile_shouldReturnTrue(){
        let expectedResult = sut.shouldExecute(.getDefaultProfile)
        
        XCTAssertTrue(expectedResult)
    }
    
    func test_shouldExecute_givenProfileTypePremium_shouldReturnTrue(){
        let expectedResult = sut.shouldExecute(.getProfileType(.premium))
        
        XCTAssertTrue(expectedResult)
    }
    
    func test_shouldExecute_givenProfileTypeStandard_shouldReturnFalse(){
        let expectedResult = sut.shouldExecute(.getProfileType(.standard))
        
        XCTAssertFalse(expectedResult)
    }
    
    func test_shouldExecute_givenActivities_shouldReturnTrue(){
        let expectedResult = sut.shouldExecute(.getActivities)
        
        XCTAssertTrue(expectedResult)
    }
    
}
