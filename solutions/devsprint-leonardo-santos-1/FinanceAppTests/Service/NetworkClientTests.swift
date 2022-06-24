//
//  NetworkClientTests.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-23.
//

import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    private let sut: NetworkClient = { NetworkClient() }()
       
       func test_performRequest_whenCompletesWithError_shouldReturnNil() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.configureRequest(data: nil, response: nil, and: NSError.fixture())
           let expec = expectation(description: "")
           sut.performRequest(with: URL.fixture() , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithResponse_shouldReturnNotNil() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.configureRequest(data: nil, response: HTTPURLResponse.succesFixture(), and: nil)
           let expec = expectation(description: "")
           sut.performRequest(with: URL.fixture() , completion: { data in
               XCTAssertNotNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesOnlyWithData_shouldReturnNil() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.configureRequest(data: Data.fixture(), response: nil, and: nil)
           let expec = expectation(description: "")
           sut.performRequest(with: URL.fixture() , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithHTTPStatusCode2XX_shouldReturnNotNil() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.configureRequest(data: Data.fixture(), response: HTTPURLResponse.succesFixture(), and: nil)
           let expec = expectation(description: "")
           sut.performRequest(with: URL.fixture() , completion: { data in
               XCTAssertNotNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithHTTPStatusCode4XX_shouldReturnNil() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.configureRequest(data: nil, response: HTTPURLResponse.clientErrorFixture(), and: nil)
           let expec = expectation(description: "")
           sut.performRequest(with: URL.fixture() , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenCompletesWithHTTPStatusCode5XX_shouldReturnNil() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.configureRequest(data: nil, response: HTTPURLResponse.serverErrorFixture(), and: nil)
           let expec = expectation(description: "")
           sut.performRequest(with: URL.fixture() , completion: { data in
               XCTAssertNil(data)
               expec.fulfill()
           })
           wait(for: [expec], timeout: 1)
       }
       
       func test_performRequest_whenURLIsPassed_requestShouldReceiveTheSameURL() {
           URLProtocol.registerClass(URLProtocolStub.self)
           URLProtocolStub.subscribe { request in
               XCTAssertEqual(URL.fixture(), request.url)
           }
           sut.performRequest(with: URL.fixture() , completion: { _ in })
       }
    
}
