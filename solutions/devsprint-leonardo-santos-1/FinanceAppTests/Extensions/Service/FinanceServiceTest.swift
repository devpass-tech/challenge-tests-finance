import XCTest

@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    private let networkSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkSpy)
    
    func testFetchActivityDetailsGivenURLShoulCallNetworkClientWithCorrectURL() {
        sut.fetchActivityDetails { [networkSpy] _ in
            XCTAssertTrue(networkSpy.performRequestCalled)
            XCTAssertEqual(networkSpy.performRequestCallCount, 1)
            XCTAssertEqual(networkSpy.performRequestUrlPassed?.absoluteString, Constants.fetchActivityDetailsUrlString)
        }
    }
    
    func testFetchActivityDetailsWhenDataIsNilshouldReturnNil() {
        networkSpy.performRequestCompletionToBeReturned = nil
        
        sut.fetchActivityDetails { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchActivityDetailsWhenDataIsNotNilWhenDecodeSucceedShouldReturnCorrectActivityDetails() {
        networkSpy.performRequestCompletionToBeReturned = Constants.defaultData
        
        sut.fetchActivityDetails { response in
            XCTAssertNotNil(response)
        }
    }
    
    func testFetchActivityDetailsWhenDataIsNotNilWhenDecodeErrorShouldReturnNilActivityDetails() {
        networkSpy.performRequestCompletionToBeReturned = Constants.defaultDataWithError
        
        sut.fetchActivityDetails { response in
            XCTAssertNil(response)
        }
    }
}

private extension FinanceServiceTests {
    enum Constants {
        static let defaultDataWithError = "".data(using: .utf8)
        
        static let fetchActivityDetailsUrlString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json"
        
        static let defaultData =
        """
        {
        "name": "Mall",
        "category": "Shopping",
        "price": 100,
        "time": "8:57 AM"
        }
        """.data(using: .utf8)
    }
}
