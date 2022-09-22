import XCTest
@testable import FinanceApp

import XCTest

@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    private let networkClientSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkClientSpy)

    func test_fetchActivityDetails_givenCorrectData_shouldReturnCorrectActivityDetails() {
        networkClientSpy.completionData = correctData

        sut.fetchActivityDetails {
            XCTAssertEqual($0, .fixture(name: "Mall", price: 100, category: "Shopping", time: "8:57 AM"))
        }

        makeDefaultTests()
    }

    func test_fetchActivityDetails_givenParseFailData_shouldReturnNil() {
        networkClientSpy.completionData = parseFailData

        sut.fetchActivityDetails {
            XCTAssertNil($0)
        }

        makeDefaultTests()
    }

    func test_fetchActivityDetails_givenNilData_shouldReturnNil() {
        networkClientSpy.completionData = nil

        sut.fetchActivityDetails {
            XCTAssertNil($0)
        }

        makeDefaultTests()
    }

    func test_fetchActivityDetails_testSingleCountAndCorrectUrlString() {
        sut.fetchActivityDetails { _ in }

        makeDefaultTests()
    }
}

extension FinanceServiceTests {

    var correctData: Data? {
        """
        {
          "name": "Mall",
          "category": "Shopping",
          "price": 100.0,
          "time": "8:57 AM"
        }
        """.data(using: .utf8)
    }

    var parseFailData: Data? {
        """
        """.data(using: .utf8)
    }

    func makeDefaultTests() {
        let expectedURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json"

        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
        XCTAssertEqual(networkClientSpy.url?.description, expectedURL)
    }
}
