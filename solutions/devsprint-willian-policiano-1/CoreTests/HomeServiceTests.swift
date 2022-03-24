import XCTest

@testable import Core

class HttpClientSpy: HttpClient {
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
}

class HomeServiceTests: XCTestCase {
    typealias Result = HomeService.Result
    typealias ServiceError = HomeService.Error

    func test_initDoesNotPerformAnyRequest() {
        let (_, httpClient) = makeSUT()

        XCTAssertEqual(httpClient.requestsCallsCount, 0)
    }

    func test_performsRequestOnGet() {
        let (sut, httpClient) = makeSUT()

        sut.getHome { _ in }

        XCTAssertEqual(httpClient.requestsCallsCount, 1)
    }

    func test_sendsUrlOnRequest() {
        let expectedUrl = URL.anyValue
        let (sut, httpClient) = makeSUT(url: expectedUrl)

        sut.getHome { _ in }

        XCTAssertEqual(httpClient.urls, [expectedUrl])
    }

    func test_failsOnRequestError() {
        let (sut, httpClient) = makeSUT()

        var actualResult: Result?
        sut.getHome { result in
            actualResult = result
        }
        let expectedError = NSError.anyValue
        httpClient.completions[0](.failure(expectedError))

        XCTAssertThrowsError(try actualResult?.get()) { actualError in
            XCTAssertEqual(actualError as? ServiceError, .connection)
        }
    }

    func test_failsOnHttpCodeDifferentThanOk() {
        let (sut, httpClient) = makeSUT()

        var actualResult: Result?
        sut.getHome { result in
            actualResult = result
        }
        httpClient.completions[0](.success((400, jsonData)))

        XCTAssertThrowsError(try actualResult?.get()) { actualError in
            XCTAssertEqual(actualError as? ServiceError, .notOk)
        }
    }

    func test_parseHomeFromDataOnHttpCodeOk() throws {
        let (sut, httpClient) = makeSUT()

        var actualResult: Result?
        sut.getHome { result in
            actualResult = result
        }
        httpClient.completions[0](.success((200, jsonData)))

        XCTAssertEqual(try actualResult?.get(), Home(balance: 15459.27, savings: 1000.0, spending: 500.0))
    }

    // MARK: Helpers

    private let jsonData = Data("""
    {
        "balance_price": "15459.27",
        "svgs": 1000.0,
        "spending": 500.0
    }
    """.utf8)

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
