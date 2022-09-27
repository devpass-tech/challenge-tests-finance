import XCTest

@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    private let delegateSpy = HomeViewModelDelegateSpy()
    private let financeHomeSpy = FinanceHomeServiceSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    
    private lazy var sut = HomeViewModel(
            financeService: financeHomeSpy,
            dispatchQueue: dispatchQueueSpy
    )
    
    func test_fetchData_givenNilData_shouldNotCallDelegate(){
        financeHomeSpy.fetchHomeDataCompletionDataToBeReturned = nil
        
        sut.fetchData()
        
        XCTAssertTrue(financeHomeSpy.fetchHomeDataCalled)
        XCTAssertNil(financeHomeSpy.fetchHomeDataCompletionDataToBeReturned)
        XCTAssertFalse(dispatchQueueSpy.calledDispatchQueueAsync)
        XCTAssertFalse(delegateSpy.didFetchHomeDataCalled)
    }
    
    func test_fetchData_givenValidaData_shouldCallDelegate(){
        sut.delegate = delegateSpy
        
        financeHomeSpy.fetchHomeDataCompletionDataToBeReturned = HomeData.fixture(balance: 0, savings: 0, spending: 0, activity: [])
        
        sut.fetchData()
        
        XCTAssertTrue(financeHomeSpy.fetchHomeDataCalled)
        XCTAssertNotNil(financeHomeSpy.fetchHomeDataCompletionDataToBeReturned)
        XCTAssertTrue(dispatchQueueSpy.calledDispatchQueueAsync)
        XCTAssertTrue(delegateSpy.didFetchHomeDataCalled)
    }
}
