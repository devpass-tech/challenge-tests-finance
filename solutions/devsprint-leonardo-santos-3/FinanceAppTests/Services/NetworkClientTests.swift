
import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    // MARK: - Private Properties
    private var sessionDataDummy = URLSessionDataDummy()
    private lazy var sessionSpy = URLSessionSpy(urlSessionData: sessionDataDummy)
    private lazy var sut = NetworkClient(session: sessionSpy)
    
    // MARK: - Methods
    
    func test_performRequestWasCalled() {
        
        // When
        sut.performRequest(with: .fixtureURL(), completion: { _ in })
        
        // Then
        XCTAssertTrue(sessionSpy.dataTaskWasCalled)
    }
    
    func test_networkSessionWasCalledOnlyOnce() {
        
        // When
        sut.performRequest(with: .fixtureURL(), completion: { _ in })
        
        // Then
        XCTAssertEqual(sessionSpy.dataTaskCount, 1)
    }
    
    func test_performRequestWasUrlCorrectly() {
        
        // When
        sut.performRequest(with: .fixtureURL(), completion: { _ in })
        
        // Then
        XCTAssertEqual(sessionSpy.dataTaskURL, .fixtureURL())
    }
    
    func test_performRequestWasReturnedDataSuccessfully() {

        var expectedData: Data?
        
        // When
        sessionSpy.dataReturned = .fixtureData()
        sut.performRequest(with: .fixtureURL(), completion: {
            expectedData = $0
        })

        // Then
        XCTAssertEqual(expectedData, .fixtureData())
    }
    
    func test_performRequestWasReturnedDataFailure() {
        
        var expectedData: Data?

        // When
        sessionSpy.errorReturned = NSError.init(domain: "", code: 404)
        sut.performRequest(with: .fixtureURL(), completion: {
            expectedData = $0
        })

        // Then
        XCTAssertNil(expectedData)
    }
}

extension URL {
    static func fixtureURL() -> Self {
        .init(string: "https://www.some.com")!
    }
}

extension Data {
    static func fixtureData() -> Self? {
        """
            {
                author: Teste
            }
        """.data(using: .utf8)
    }
}
