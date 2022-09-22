import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {
    
    private let networkClientSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkClientSpy)
    
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
        
        XCTAssertEqual(networkClientSpy.completionData, nil)
        XCTAssertEqual(expectedData, nil)
    }
    
    func test_test_transferAmount_whenPerformRequestDataReturnValidData_shouldReturnTransferData(){
        
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
    
    func test_test_transferAmount_givenData_withFailedParse_shouldReturnNil(){
        
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
