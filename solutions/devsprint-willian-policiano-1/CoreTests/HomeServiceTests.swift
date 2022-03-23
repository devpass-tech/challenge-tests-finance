import XCTest

class HttpClient {
    typealias Result = Swift.Result<Int, Error>
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

class HomeService {
    private let httpClient: HttpClient
    private let url: URL

    init(url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }

    func getHome(completion: @escaping (Error) -> Void) {
        httpClient.request(url: url) { result in
            switch result {
            case .success:
                completion(HttpCodeNotOkError())
            case .failure(let error):
                completion(error)
            }

        }
    }
}

struct HttpCodeNotOkError: Error { }

struct Home { }

class HomeServiceTests: XCTestCase {

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

        var actualResult: Error?
        sut.getHome { result in
            actualResult = result
        }
        let expectedError = NSError.anyValue
        httpClient.completions[0](.failure(expectedError))

        XCTAssertEqual(actualResult as NSError?, expectedError)
    }

    func test_failsOnHttpCodeDifferentThanOk() {
        let (sut, httpClient) = makeSUT()

        var actualResult: Error?
        sut.getHome { result in
            actualResult = result
        }
        httpClient.completions[0](.success(400))

        XCTAssertNotNil(actualResult as? HttpCodeNotOkError)
    }

    // MARK: Helpers

    private func makeSUT(url: URL = .anyValue) -> (HomeService, HttpClient) {
        let httpClient = HttpClient()
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
