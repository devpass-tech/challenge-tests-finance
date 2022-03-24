import XCTest

@testable import Core

class HttpClientSpy: HttpClient {
    typealias Success = (code: Int, data: Data)
    typealias Result = Swift.Result<(code: Int, data: Data), Error>
    var requestsCallsCount: Int {
        completions.count
    }

    private(set) var urls: [URL] = []
    private(set) var completions: [(Result) -> Void] = []

    func request(url: URL, completion: @escaping (Result) -> Void) {
        completions.append(completion)
        urls.append(url)
    }

    func completeWithSuccess(_ data: Success) {
        completions[0](.success(data))
    }

    func completeWithError(_ error: Error) {
        completions[0](.failure(error))
    }
}

class HomeServiceTests: XCTestCase {
    typealias Result = HomeService.Result
    typealias ServiceError = HomeService.Error

    func test_initDoesNotPerformAnyRequest() {
        let (_, httpClient) = makeSUT()

        XCTAssertEqual(httpClient.requestsCallsCount, 0)
    }

    func test_sendsUrlOnRequest() {
        let expectedUrl = URL.anyValue
        let (sut, httpClient) = makeSUT(url: expectedUrl)

        sut.getHome { _ in }

        XCTAssertEqual(httpClient.urls, [expectedUrl])
    }

    func test_failsOnRequestError() {
        let expectedError = NSError.anyValue

        let actualResult = result(when: { httpClient in
            httpClient.completeWithError(expectedError)
        })

        XCTAssertEqual(actualResult?.error as? ServiceError, .connection)
    }

    func test_failsOnHttpCodeDifferentThanOk() {
        let actualResult = result(when: { httpClient in
            httpClient.completeWithSuccess((400, self.jsonData))
        })

        XCTAssertEqual(actualResult?.error as? ServiceError, .notOk)
    }

    func test_parseHomeFromDataOnHttpCodeOk() throws {
        let actualResult = result(when: { httpClient in
            httpClient.completeWithSuccess((200, self.jsonData))
        })

        XCTAssertEqual(try actualResult?.get(), Home(balance: 15459.27, savings: 1000.0, spending: 500.0))
    }

    func test_failsWhenBalanceIsNotNumber() throws {
        let invalidJson = Data("""
        {
            "balance_price": "ABC$#@",
            "svgs": 1000.0,
            "spending": 500.0
        }
        """.utf8)

        let actualResult = result(when: { httpClient in
            httpClient.completeWithSuccess((200, invalidJson))
        })

        XCTAssertEqual(actualResult?.error as? ServiceError, .invalidData)
    }

    func test_failsWhenBalanceIsEmpty() throws {
        let invalidJson = Data("""
        {
            "balance_price": "",
            "svgs": 1000.0,
            "spending": 500.0
        }
        """.utf8)

        let actualResult = result(when: { httpClient in
            httpClient.completeWithSuccess((200, invalidJson))
        })

        XCTAssertEqual(actualResult?.error as? ServiceError, .invalidData)
    }

    // MARK: Helpers

    private let jsonData = Data("""
    {
        "balance_price": "15459.27",
        "svgs": 1000.0,
        "spending": 500.0
    }
    """.utf8)

    private func result(when: @escaping (HttpClientSpy) -> Void) -> Result? {
        let (sut, httpClient) = makeSUT()

        var actualResult: Result?
        sut.getHome { result in
            actualResult = result
        }
        when(httpClient)

        return actualResult
    }

    private func makeSUT(url: URL = .anyValue) -> (HomeService, HttpClientSpy) {
        let httpClient = HttpClientSpy()
        let sut = HomeService(url: url, httpClient: httpClient)

        return (sut, httpClient)
    }
}

extension URL {
    static var anyValue: URL {
        URL(fileURLWithPath: UUID().uuidString)
    }
}

extension NSError {
    static var anyValue: NSError {
        NSError(domain: UUID().uuidString, code: 0, userInfo: nil)
    }
}

extension Result {
    var error: Error? {
        if case let .failure(error) = self {
            return error
        }
        return nil
    }
}
