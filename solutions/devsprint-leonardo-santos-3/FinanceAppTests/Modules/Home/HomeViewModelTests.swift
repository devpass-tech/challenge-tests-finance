import XCTest

@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {

    func test_fetchData_calledDispatchQueueAsync() {
        let networkClientSpy = NetworkClientSpy()
        let financeServiceSpy = FinanceService(networkClient: networkClientSpy)
        let dispatchQueueSpy = DispatchQueueSpy()
        let sut = HomeViewModel(financeService: financeServiceSpy,
                                dispatchQueue: dispatchQueueSpy)

        networkClientSpy.completionData = HomeData(balance: 12, savings: 12, spending: 12, activity: [])
        sut.fetchData()

        XCTAssertTrue(dispatchQueueSpy.calledDispatchQueueAsync)
    }

}

