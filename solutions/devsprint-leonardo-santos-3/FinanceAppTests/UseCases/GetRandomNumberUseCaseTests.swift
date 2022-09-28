
import XCTest

@testable import FinanceApp

final class GetRandomNumberUserCaseTests: XCTestCase {
    
    private let sut = GetRandomNumberUseCase()
    
    func test_getRandom_ShouldBeGenerateRandoNumber_WhenNumberLessToFinal() {
     
        let expectedInitialNumber = 1
        let expectedFinalNumber = 100
        
        XCTAssertTrue(expectedInitialNumber < expectedFinalNumber)
    }
    
    func test_getRandom_ShouldBeGenerateRandoNumber_WhenNumberGreaterToFinal() {
     
        let expectedInitialNumber = 10
        let expectedFinalNumber = 100
        
        XCTAssertTrue(expectedFinalNumber > expectedInitialNumber)
    }
    
    func test_getRandomNumber_ShouBeGenerateRandomNumber_WhenNumberGreaterThanOrEqualToInitial() {
        
        let expectedInitialNumber = 1
        
        let randomNumber = sut.execute(from: expectedInitialNumber, to: 10, exceptions: nil)
        
        XCTAssertTrue(randomNumber >= expectedInitialNumber)
    }
    
    func test_getRandomNumber_ShouBeGenerateRandomNumber_WhenNumberLessThanOrEqualToFinal() {
        
        let expectedFinalNumber = 20
        
        let randomNumber = sut.execute(from: 1, to: expectedFinalNumber, exceptions: nil)
        
        XCTAssertTrue(randomNumber <= expectedFinalNumber)
    }
    
    func test_getRandomNumber_ShouBeRangeNumbers_WhenRangeNumbersExceptionCorrectly() {
        
        let exceptions = [3, 2, 10]
        
        let randomNumber = sut.execute(from: 1, to: 10, exceptions: exceptions)
        
        XCTAssertFalse(exceptions.contains(where: { $0 == randomNumber }))
    }
}


// ALERT: Thread 1: Fatal error: Range requires lowerBound <= upperBound
