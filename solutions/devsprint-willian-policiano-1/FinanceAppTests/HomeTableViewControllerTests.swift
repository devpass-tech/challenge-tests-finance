import XCTest
import Core

// SUT

class HomeTableViewController {
    init(service: HomeLoader) {
        
    }
}

// Test Doubles

class HomeLoaderSpy: HomeLoader {
    var getHomeCallsCount: Int {
        completions.count
    }

    private(set) var completions: [(HomeLoader.Result) -> Void] = []

    func getHome(completion: @escaping (HomeLoader.Result) -> Void) {
        completions.append(completion)
    }
}

// Test

class HomeTableViewControllerTests: XCTestCase {
    func test_initShouldNotPerformAnyRequest() {
        let service = HomeLoaderSpy()
        let _ = HomeTableViewController(service: service)

        XCTAssertEqual(service.getHomeCallsCount, 0)
    }
}
