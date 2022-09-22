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
    
    func test_transferAmount_wasCalled(){
        sut.transferAmount { _ in  }
        
        XCTAssertTrue(networkClientSpy.performRequestCalled)
    }
    
    func test_transferAmount_wasCalledOnlyOnce(){
        sut.transferAmount { _ in  }
        
        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
    }
    
    func test_transferAmount_shouldSendCorrectUrl(){
        sut.transferAmount { _ in  }
        
        XCTAssertEqual(networkClientSpy.url?.description, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json")
    }
    
    func test_transferAmount_whenPerformRequestDataReturnNil_shouldReturnNil(){
        var expectedData: TransferResult?
        
        sut.transferAmount { expectedData = $0 }
        
        XCTAssertNil(networkClientSpy.completionData)
        XCTAssertNil(expectedData)
    }
    
    func test_transferAmount_whenPerformRequestDataReturnValidData_shouldReturnTransferData(){
        
        var transferDataJSON: Data? {
            """
            {
                "success": true
            }
            """.data(using: .utf8)
        }
        
        networkClientSpy.completionData = transferDataJSON
        
        sut.transferAmount {
            XCTAssertEqual($0, .fixture(success: true))
        }
        
    }
    
    func test_transferAmount_givenData_withFailedParse_shouldReturnNil(){
        
        var transferDataJSON: Data? {
            """
            {
                "_": "false"
            }
            """.data(using: .utf8)
        }
        
        networkClientSpy.completionData = transferDataJSON
        
        sut.transferAmount {
            XCTAssertNil($0)
        }
        
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
