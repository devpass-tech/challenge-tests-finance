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
    
    func test_fetchHomeData_whenRequestSucceed_shouldSuccessResponse() {
        var expectedResponse: Result<HomeData, Error>?
        
        let homeData: HomeData = .fixture(savings: 100)
        let requestToBeReturned: Result<HomeData, NetworkError> = .success(homeData)
        
        networkSpy.performRequestToBeReturned = requestToBeReturned
        
        sut.fetchHomeData { expectedResponse = $0 }
        
        XCTAssertTrue(networkSpy.performRequestCalled)
        XCTAssertTrue(expectedResponse?.isSuccess == true)
        XCTAssertNotNil(expectedResponse?.value)
        XCTAssertNil(expectedResponse?.error)
    }
    
    func test_fetchHomeData_whenRequestFails_shouldFailResponse() {
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
    
    func test_fetchHomeData_whenContentIsValid_shouldSuccessResponse() {
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
    
    func test_fetchHomeData_whenContentIsNotValid_shouldFailResponse() {
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
    
    func test_fetchContactList_whenRequestSucceed_shouldSuccessResponse() {
        var expectedResponse: Result<[Contact], Error>?
        let contacts: [Contact] = [.fixture(), .fixture()]
        let requestToBeReturned: Result<[Contact], NetworkError> = .success(contacts)
        
        networkSpy.performRequestToBeReturned = requestToBeReturned
        
        sut.fetchContactList { expectedResponse = $0 }
        
        XCTAssertTrue(networkSpy.performRequestCalled)
        XCTAssertNotNil(networkSpy.performRequestUrlPassed)
        XCTAssertNotNil(networkSpy.performRequestToBeReturned)
        XCTAssertTrue(expectedResponse?.isSuccess == true)
        XCTAssertNotNil(expectedResponse?.value)
        XCTAssertNil(expectedResponse?.error)
    }
    
    func test_fetchContactList_whenRequestFails_shouldFailResponse() {
        var expectedResponse: Result<[Contact], Error>?
        let expectedError: NetworkError = .random()
        let requestToBeReturned: Result<[Contact], NetworkError> = .failure(expectedError)
        
        networkSpy.performRequestToBeReturned = requestToBeReturned
        
        sut.fetchContactList { expectedResponse = $0 }
        
        XCTAssertTrue(networkSpy.performRequestCalled)
        XCTAssertNotNil(networkSpy.performRequestUrlPassed)
        XCTAssertNotNil(networkSpy.performRequestToBeReturned)
        XCTAssertTrue(expectedResponse?.isFailure == true)
        XCTAssertEqual(expectedResponse?.error?.localizedDescription, expectedError.localizedDescription)
        XCTAssertNil(expectedResponse?.value)
    }
    
    func test_fetchContactList_whenContentIsValid_shouldSuccessResponse() {
        var expectedResponse: Result<[Contact], Error>?
        let networkStub = NetworkClientStub(filename: "contact-valid")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchContactList { expectedResponse = $0 }
        
        switch expectedResponse {
        case .success(let content):
            XCTAssertEqual(content.first?.name, "Ronald Robertson")
            XCTAssertEqual(content.first?.phone, "+55 (11) 99999-9999")
            XCTAssertEqual(content.count, 7)
        default:
            XCTFail("Resultado deveria ter sido sucesso")
        }
    }

    func test_fetchContactList_whenContentIsNotValid_shouldFailResponse() {
        var expectedResponse: Result<[Contact], Error>?
        let networkStub = NetworkClientStub(filename: "contact-invalid")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchContactList { expectedResponse = $0 }
        
        switch expectedResponse {
        case.failure(let error):
            XCTAssertTrue(error is NetworkError)
            XCTAssertEqual(error as? NetworkError, NetworkError.parseError)
        default:
            XCTFail("Resultado deveria ter sido falha")
        }
    }
}
