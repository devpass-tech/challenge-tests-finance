import XCTest

@testable import FinanceApp

final class ActivityDetailViewModelTests: XCTestCase {
    // MARK: Properties
    private let networkClientSpy = NetworkClientSpy()
    private lazy var financeServiceSpy = FinanceService(networkClient: networkClientSpy)
    private let dispatchQueueSpy = DispatchQueueSpy()
    private lazy var sut = ActivityDetailsViewModel(financeService: financeServiceSpy,
                                                    dispatchQueue: dispatchQueueSpy)

    // MARK: Test Methods
    func test_fetchData_whenDataIsNoNil_ShouldCallDispatchQueueAsync() {
        networkClientSpy.completionData = correctActivityDetailsData
        sut.fetchData()

        XCTAssertTrue(dispatchQueueSpy.calledDispatchQueueAsync)
    }
}

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
