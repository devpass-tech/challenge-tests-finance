//
//  NetworkClientTests.swift
//  FinanceAppTests
//
//  Created by Marcos Amorim Rossi de Carvalho on 20/11/22.
//

import Foundation
import XCTest

@testable import FinanceApp

class NetworkClientTests: XCTestCase {
    
    enum MyError: Error {
        case genericError
    }
    
    private var urlSessionSpy = URLSessionSpy()
    private lazy var sut = NetworkClient(urlSession: self.urlSessionSpy)
    
    var mockedJson =
"""
{
    "balance": 1,
    "savings": 2,
    "spendings": 3
}
""".data(using: .utf8)
    
    func test_performRequest_gotCalledCorrectly() {
        let urlToBePassed = URL(string: "https://www.notion.so/devpass/")!
        
        sut.performRequest(with: urlToBePassed, completion: {
            _ in
            XCTAssertTrue(self.urlSessionSpy.dataTaskCalled)
        })
        
    }
    
    func test_performRequest_shouldReturnCorrectData() {
        let urlToBePassed = URL(string: "https://www.notion.so/devpass/")!
        urlSessionSpy.setData(data: mockedJson!)
        
        sut.performRequest(with: urlToBePassed, completion: {
            data in
            XCTAssertEqual(data, self.mockedJson)
        })
        
    }
    
    func test_performRequest_shouldReturnNilData() {
        let urlToBePassed = URL(string: "https://www.notion.so/devpass/")!
        
        sut.performRequest(with: urlToBePassed, completion: {
            data in
            XCTAssertNil(data)
        })
        
    }
    
    func test_performRequest_whenErrorAndDataAreNotNil_shouldReturnNilData() {
        let urlToBePassed = URL(string: "https://www.notion.so/devpass/")!
        urlSessionSpy.setData(data: mockedJson!)
        urlSessionSpy.setError(error: MyError.genericError)
        
        sut.performRequest(with: urlToBePassed, completion: {
            data in
            XCTAssertNil(data)
        })
        
    }
    
}
