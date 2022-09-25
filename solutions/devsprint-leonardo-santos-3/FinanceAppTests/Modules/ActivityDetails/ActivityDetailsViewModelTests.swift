import XCTest

@testable import FinanceApp

final class ActivityDetailViewModelTests: XCTestCase {

    func test_fetchData_calledDispatchQueueAsync() {
        let networkClientSpy = NetworkClientSpy()
        let financeServiceSpy = FinanceService(networkClient: networkClientSpy)
        let dispatchQueueSpy = DispatchQueueSpy()
        let sut = ActivityDetailsViewModel(financeService: financeServiceSpy,
                                           dispatchQueue: dispatchQueueSpy)

        
        networkClientSpy.completionData = correctActivityDetailsData
        sut.fetchData()

        XCTAssertTrue(dispatchQueueSpy.calledDispatchQueueAsync)
    }

}

extension ActivityDetailViewModelTests {
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
