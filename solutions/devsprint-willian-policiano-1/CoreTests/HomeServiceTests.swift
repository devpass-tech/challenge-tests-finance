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
    typealias Result = Swift.Result<Home, Error>

    private let httpClient: HttpClient
    private let url: URL

    private let httpOK = 200

    init(url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }

    func getHome(completion: @escaping (Result) -> Void) {
        httpClient.request(url: url) { result in
            switch result {
            case let .success(httpCode) where httpCode != self.httpOK:
                completion(.failure(HttpCodeNotOkError()))
            case .success:
                completion(.success(Home()))
            case .failure(let error):
                completion(.failure(error))
            }

        }
    }
}

struct HttpCodeNotOkError: Error { }

struct Home: Equatable { }

class HomeServiceTests: XCTestCase {
    typealias Result = HomeService.Result

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
            XCTAssertEqual(actualError as NSError?, expectedError)
        }
    }

    func test_failsOnHttpCodeDifferentThanOk() {
        let (sut, httpClient) = makeSUT()

        var actualResult: Result?
        sut.getHome { result in
            actualResult = result
        }
        httpClient.completions[0](.success(400))

        XCTAssertThrowsError(try actualResult?.get()) { actualError in
            XCTAssertNotNil(actualError as? HttpCodeNotOkError)
        }
    }

    func test_deliversHomeOnHttpCodeOk() {
        let (sut, httpClient) = makeSUT()

        var actualResult: Result?
        sut.getHome { result in
            actualResult = result
        }
        httpClient.completions[0](.success(200))

        XCTAssertEqual(try? actualResult?.get(), Home())
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
