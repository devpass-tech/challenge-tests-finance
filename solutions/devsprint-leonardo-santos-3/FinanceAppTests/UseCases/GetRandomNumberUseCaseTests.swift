
import XCTest

@testable import FinanceApp

final class GetRandomNumberUserCaseTests: XCTestCase {
    
    private let sut = GetRandomNumberUseCase()
    
    func test_getRandomNumber_givenInitialNumber_shouldReturnRandomNumberGreaterThanOrEqualToInitial() {
        
        let expectedInitialNumber = 1
        
        let randomNumber = sut.execute(from: expectedInitialNumber, to: 10, exceptions: nil)
        
        XCTAssertTrue(randomNumber >= expectedInitialNumber)
    }
    
    func test_getRandomNumber_givenFinalNumber_shouldReturnRandomNumberLessThanOrEqualToFinal() {
        
        let expectedFinalNumber = 20
        
        let randomNumber = sut.execute(from: 1, to: expectedFinalNumber, exceptions: nil)
        
        XCTAssertTrue(randomNumber <= expectedFinalNumber)
    }
    
    func test_getRandomNumber_givenExecptionList_shouldReturnNumberDiferenceFromExeceptionList() {
        
        let exceptions = [3]
        
        let randomNumber = sut.execute(from: 1, to: 10, exceptions: exceptions)
        
        XCTAssertFalse(exceptions.contains { $0 == randomNumber })
    }
}
