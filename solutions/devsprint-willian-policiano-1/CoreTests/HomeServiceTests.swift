import XCTest

class HttpClient {
    private(set) var requestsCallsCount = 0
    private(set) var urls: [URL] = []

    func request(url: URL) {
        requestsCallsCount += 1
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

    func getHome() {
        httpClient.request(url: url)
    }
}

class HomeServiceTests: XCTestCase {

    func test_initDoesNotPerformAnyRequest() {
        let (_, httpClient) = makeSUT()

        XCTAssertEqual(httpClient.requestsCallsCount, 0)
    }

    func test_performsRequestOnGet() {
        let (sut, httpClient) = makeSUT()

        sut.getHome()

        XCTAssertEqual(httpClient.requestsCallsCount, 1)
    }

    func test_sendsUrlOnRequest() {
        let expectedUrl = URL.anyValue
        let (sut, httpClient) = makeSUT(url: expectedUrl)

        sut.getHome()

        XCTAssertEqual(httpClient.urls, [expectedUrl])
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
