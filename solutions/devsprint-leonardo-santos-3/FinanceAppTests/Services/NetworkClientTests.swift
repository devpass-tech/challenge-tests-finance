
import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private let sessionSpy = NetworkSessionSpy()
    private lazy var sut = NetworkClient(session: sessionSpy)
    
    // MARK: - Methods
    
    func test_networkSessionWasCalled() {
        
        // When
        sut.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertTrue(sessionSpy.wasCalled)
    }
    
    func test_networkSessionWasCalledOnlyOnce() {
        
        // When
        sut.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertEqual(sessionSpy.dataTaskCount, 1)
    }
    
    func test_networkSessionWasUrlCorrectly() {
        
        // When
        sut.performRequest(with: .fixtureURL, completion: { _ in })
        
        // Then
        XCTAssertEqual(sessionSpy.url, .fixtureURL)
    }
    
    func test_networkSessionCompletionWasDataSuccessfully() {

        var expectedData: Data?
        
        // When
        sessionSpy.completionData = .fixtureData
        sut.performRequest(with: .fixtureURL, completion: {
            expectedData = $0
        })

        // Then
        XCTAssertEqual(expectedData, .fixtureData)
    }
    
    func test_networkSessionCompletionWasFailureData() {
        
        var expectedData: Data?

        // When
        sessionSpy.shouldFailTask = true
        sut.performRequest(with: .fixtureURL, completion: {
            expectedData = $0
        })

        // Then
        XCTAssertNil(expectedData)
    }
}


extension URL {
    static var fixtureURL: Self {
        URL(string: "some/path")!
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
