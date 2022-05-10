//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 09/05/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {
    
    var sut: FinanceService!
    let networkClientMock: NetworkClientMock = NetworkClientMock()

    override func setUp() {
        sut = FinanceService(networkClient: networkClientMock)
    }

    override func tearDown() {
        sut = nil
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ShouldBeNotNil() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldBeNotNil")
        sut.fetchActivityDetails { result in
            
            guard let result = result else {
                XCTAssertNil(result, "the response result fails because it's not nil.")
                XCTFail("API Response Error.")
                expectations.fulfill()
                return
            }
            
            XCTAssertNotNil(result, "the response result fails because it's nil.")
            expectations.fulfill()
        }
        
        self.waitForExpectations(timeout: 3.0)
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ShouldHaveCorrectInformations() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldHaveCorrectInformations")
        sut.fetchActivityDetails { result in
            guard let result = result else {
                return
            }

            XCTAssertEqual(result.name, "Mall", "the received name property fails becuase is not equal to json payload.")
            XCTAssertEqual(result.category, "Shopping", "the received category property fails becuase is not equal to json payload.")
            XCTAssertEqual(result.price, 100.0, "the received price property fails becuase is not equal to json payload.")
            XCTAssertEqual(result.time, "8:57 AM", "the received time property fails becuase is not equal to json payload.")
            
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ResponsePropertiesShouldNotBeEmptyStrings() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ResponsePropertiesShouldNotBeEmptyStrings")
        sut.fetchActivityDetails { result in
            guard let result = result else {
                return
            }

            XCTAssertNotEqual(result.name, "", "the received name property fails becuase can not contain empty strings.")
            XCTAssertNotEqual(result.category, "", "the received category property fails becuase can not contain empty strings.")
            XCTAssertNotEqual(result.price, 0, "the received price property fails becuase is not equal to json payload.")
            XCTAssertNotEqual(result.time, "", "the received time property fails becuase can not contain empty strings.")
            
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
    }
    
    func testNetworkClientMock_WhenGivenURLToGetResourceNameMethod_ShouldReturnResourceName() {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!
        let resourceName = networkClientMock.getResourceName(url: url)
        
        XCTAssertNotNil(resourceName)
        XCTAssertEqual(resourceName, "activity_details_endpoint")
    }

}
