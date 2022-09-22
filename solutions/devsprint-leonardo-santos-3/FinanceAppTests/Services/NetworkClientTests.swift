
import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private let spy = NetworkClientSpy()
    
    // MARK: - Methods
    
    func test_performRequest_wasCalled() {
        
        // When
        spy.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertTrue(spy.performRequestCalled)
    }
    
    func test_performRequest_wasCalledOnlyOnce() {
        
        // When
        spy.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertEqual(spy.performRequestCount, 1)
    }
    
    func test_performRequest_urlReturned() {
        
        // When
        spy.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertEqual(spy.url, .fixtureURL)
    }
    
    func test_perfomRequest_CompletionDataSuccessfully() {

        var expectedData: Data?
        
        // When
        spy.completionData = .fixtureData
        spy.performRequest(with: .fixtureURL, completion: {
            expectedData = $0
        })

        // Then
        XCTAssertEqual(expectedData, .fixtureData)
    }
    
    func test_perfomRequest_CompletionDataFailure() {
        
        var expectedData: Data?

        // When
        spy.performRequest(with: .fixtureURL, completion: {
            expectedData = $0
        })

        // Then
        XCTAssertNil(expectedData)
    }
}


extension URL {
    static var fixtureURL: Self {
        URL(fileURLWithPath: "some/path")
    }
}

extension Data {
    static var fixtureData: Self? {
        "".data(using: .utf8)
    }
}
