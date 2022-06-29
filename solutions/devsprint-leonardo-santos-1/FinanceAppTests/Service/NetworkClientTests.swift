//
//  NetworkClientTests.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-23.
//

import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    private var mockURLSession: MockURLSession?
    private var sut: NetworkClientProtocol?
       
       func test_performRequest_whenCompletesWithError_shouldReturnNil() {
           let expec = expectation(description: "performRequest_whenCompletesWithError_shouldReturnNil")
           mockURLSession = MockURLSession()
           sut = NetworkClient(urlSession: mockURLSession!)
           sut?.performRequest(with: URL(with: "https://") , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithResponse_shouldReturnNotNil() {
           let expec = expectation(description: "performRequest_whenCompletesWithResponse_shouldReturnNotNil")
           mockURLSession = MockURLSession(receivedData: Data(), receivedResponse: HTTPURLResponse.succesFixture())
           sut = NetworkClient(urlSession: mockURLSession!)
           sut?.performRequest(with: URL(with: "https://") , completion: { data in
               XCTAssertNotNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesOnlyWithData_shouldReturnNil() {
           let expec = expectation(description: "performRequest_whenCompletesOnlyWithData_shouldReturnNil")
           mockURLSession = MockURLSession(receivedData: Data())
           sut = NetworkClient(urlSession: mockURLSession!)
           sut?.performRequest(with: URL(with: "https://") , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithHTTPStatusCode2XX_shouldReturnNotNil() {
           let expec = expectation(description: "performRequest_whenCompletesWithHTTPStatusCode2XX_shouldReturnNotNil")
           mockURLSession = MockURLSession(receivedData: Data(), receivedResponse: HTTPURLResponse.succesFixture())
           sut = NetworkClient(urlSession: mockURLSession!)
           sut?.performRequest(with: URL(with: "https://") , completion: { data in
               XCTAssertNotNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithHTTPStatusCode4XX_shouldReturnNil() {
           let expec = expectation(description: "performRequest_whenCompletesWithHTTPStatusCode4XX_shouldReturnNil")
           mockURLSession = MockURLSession(receivedData: Data(), receivedResponse: HTTPURLResponse.clientErrorFixture())
           sut = NetworkClient(urlSession: mockURLSession!)
           sut?.performRequest(with: URL(with: "https://") , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithHTTPStatusCode5XX_shouldReturnNil() {
           let expec = expectation(description: "performRequest_whenCompletesWithHTTPStatusCode5XX_shouldReturnNil")
           mockURLSession = MockURLSession(receivedData: Data(), receivedResponse: HTTPURLResponse.serverErrorFixture())
           sut = NetworkClient(urlSession: mockURLSession!)
           sut?.performRequest(with: URL(with: "https://") , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenURLIsPassed_requestShouldReceiveTheSameURL() {
           mockURLSession = MockURLSession()
           sut = NetworkClient(urlSession: mockURLSession!)
           let expectedURL = URL(with: "https://")
           sut?.performRequest(with: expectedURL, completion: { _ in })
           XCTAssertEqual(expectedURL.relativeString, mockURLSession?.urlToBeReturned?.relativeString)
       }
    
}


extension HTTPURLResponse {
    static func succesFixture() -> Self {
        HTTPURLResponse(url: URL(with: "https://"), statusCode: Int.random(in: 200...299), httpVersion: nil, headerFields: nil) as! Self
    }
    
    static func clientErrorFixture() -> Self {
        HTTPURLResponse(url: URL(with: "https://"), statusCode: Int.random(in: 400...451), httpVersion: nil, headerFields: nil) as! Self
    }
    
    static func serverErrorFixture() -> Self {
        HTTPURLResponse(url: URL(with: "https://"), statusCode: Int.random(in: 500...511), httpVersion: nil, headerFields: nil) as! Self
    }
}
