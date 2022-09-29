import XCTest

@testable import FinanceApp

final class ActivityDetailViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    private let networkClientSpy = NetworkClientSpy()
    private lazy var financeServiceSpy = FinanceServiceSpy()
    private let delegateSpy = ActivityDetailsViewModelDelegateSpy()
    private let dispatchQueueSpy = DispatchQueueSpy()
    private lazy var sut = ActivityDetailsViewModel(financeService: financeServiceSpy,
                                                    dispatchQueue: dispatchQueueSpy)

    // MARK: - Test Methods
    
    func test_fetchData_whenDataIsNil_ShouldNotCallDispatchQueueAsync() {
        networkClientSpy.completionData = correctActivityDetailsData
        sut.fetchData()

        XCTAssertFalse(dispatchQueueSpy.calledDispatchQueueAsync)
    }

    func test_fetchData_shouldCallFetchActivityDetails() {

        // When
        sut.fetchData()

        // Then
        XCTAssertTrue(financeServiceSpy.fetchActivityDetailsCalled)
    }
    
    func test_fetchData_shouldCallFetchActivityDetailsOneTime() {
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertEqual(financeServiceSpy.fetchActivityDetailsCallCount, 1)
    }
    
    func test_fetchData_whenActivityDetails_shouldNotCallDelegate() {
        
        // Given
        sut.delegate = delegateSpy
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertFalse(delegateSpy.didFetchActivityDetailsCalled)
    }
}

// MARK: - Extension

private extension ActivityDetailViewModelTests {
    var correctActivityDetailsData: Data? {
        """
        {
          "name": "Mall",
          "category": "Shopping",
          "price": 100.0,
          "time": "8:57 AM"
        }
        """.data(using: .utf8)
    }
}
