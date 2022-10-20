//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {
    let networkSpy = NetworkClientSpy()
    lazy var sut = FinanceService(networkClient: networkSpy)
    
    func test_fetchHomeData_whenRequestSucceed_shouldSucessResponse() {
        var expectedResponse: Result<HomeData, Error>?
        
        let activity = Activity(name: "teste", price: 9.9, time: "10:30")
        let homeData = HomeData(balance: 100, savings: 150, spending: 50, activity: [activity])
        let requestToBeReturned: Result<HomeData, NetworkError> = .success(homeData)
        
        networkSpy.performRequestToBeReturned = requestToBeReturned
        
        sut.fetchHomeData { expectedResponse = $0 }
        
        XCTAssertTrue(networkSpy.performRequestCalled)
        XCTAssertTrue(expectedResponse?.isSuccess == true)
        XCTAssertNotNil(expectedResponse?.value)
        XCTAssertNil(expectedResponse?.error)
    }
    
    func test_fechHomeData_whenRequestFails_shouldFailResponse() {
        var expectedResponse: Result<HomeData, Error>?
        let expectedError: NetworkError = .random()
        let requestToBeReturned: Result<HomeData, NetworkError> = .failure(expectedError)
        
        networkSpy.performRequestToBeReturned = requestToBeReturned
        
        sut.fetchHomeData { expectedResponse = $0 }
        
        XCTAssertTrue(networkSpy.performRequestCalled)
        XCTAssertTrue(expectedResponse?.isFailure == true)
        XCTAssertEqual(expectedResponse?.error?.localizedDescription, expectedError.localizedDescription)
        XCTAssertNil(expectedResponse?.value)
    }
    
    func test_fechHomeData_whenContentIsValid_shouldSucessResponse() {
        var expectedResponse: Result<HomeData, Error>?
        let networkStub = NetworkClientStub(filename: "home-valid")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchHomeData { expectedResponse = $0 }
        
        switch expectedResponse {
        case .success(let content):
            XCTAssertEqual(content.balance, 15459.27)
            XCTAssertEqual(content.savings, 1000)
            XCTAssertEqual(content.spending, 500)
            XCTAssertEqual(content.activity.count, 5)
        default:
            XCTFail("Resultado deveria ter sido sucesso")
        }
    }
    
    func test_fechHomeData_whenContentIsNotValid_shouldFailResponse() {
        var expectedResponse: Result<HomeData, Error>?
        let networkStub = NetworkClientStub(filename: "home-invalid")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchHomeData { expectedResponse = $0 }
        
        switch expectedResponse {
        case.failure(let error):
            XCTAssertTrue(error is NetworkError)
        default:
            XCTFail("Resultado deveria ter sido falha")
        }
    }
}
