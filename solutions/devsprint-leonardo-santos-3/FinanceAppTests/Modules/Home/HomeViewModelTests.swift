import XCTest

@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    private let delegateSpy = HomeViewModelDelegateSpy()
    private let financeSpy = FinanceServiceSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    
    private lazy var sut = HomeViewModel(
            financeService: financeSpy,
            dispatchQueue: dispatchQueueSpy
    )
    
    func test_fetchData_givenNilData_shouldNotCallDelegate(){
        financeSpy.fetchHomeDataCompletionDataToBeReturned = nil
        
        sut.fetchData()
        
        XCTAssertTrue(financeSpy.fetchHomeDataCalled)
        XCTAssertNil(financeSpy.fetchHomeDataCompletionDataToBeReturned)
        XCTAssertFalse(dispatchQueueSpy.asyncCalled)
        XCTAssertFalse(delegateSpy.didFetchHomeDataCalled)
    }
    
    func test_fetchData_givenValidaData_shouldCallDelegate(){
        sut.delegate = delegateSpy
        
        financeSpy.fetchHomeDataCompletionDataToBeReturned = HomeData.fixture(balance: 0, savings: 0, spending: 0, activity: [])
        
        sut.fetchData()
        
        XCTAssertTrue(financeSpy.fetchHomeDataCalled)
        XCTAssertNotNil(financeSpy.fetchHomeDataCompletionDataToBeReturned)
        XCTAssertTrue(dispatchQueueSpy.asyncCalled)
        XCTAssertTrue(delegateSpy.didFetchHomeDataCalled)
    }
}
