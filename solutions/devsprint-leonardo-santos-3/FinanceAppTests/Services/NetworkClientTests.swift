
import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private let sut = NetworkClientSpy()
    
    // MARK: - Methods
    
    func test_performRequest_wasCalled() {
        
        // When
        sut.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertTrue(sut.performRequestCalled)
    }
    
    func test_performRequest_wasCalledOnlyOnce() {
        
        // When
        sut.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertEqual(sut.performRequestCount, 1)
    }
    
    func test_performRequest_urlReturned() {
        
        // When
        sut.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertEqual(sut.url, .fixtureURL)
    }
    
    func test_perfomRequest_CompletionDataSuccessfully() {

        var expectedData: Data?
        
        // When
        sut.completionData = .fixtureData
        sut.performRequest(with: .fixtureURL, completion: {
            expectedData = $0
        })

        // Then
        XCTAssertEqual(expectedData, .fixtureData)
    }
    
    func test_perfomRequest_CompletionDataFailure() {
        
        var expectedData: Data?

        // When
        sut.performRequest(with: .fixtureURL, completion: {
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
        """
            {
                author: Teste
            }
        """.data(using: .utf8)
    }
}
