import XCTest
import Core
import UIKit

// SUT

class HomeTableViewController: UITableViewController {
    private let service: HomeLoader

    init(service: HomeLoader) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        refreshControl = UIRefreshControl()
        refreshControl?.beginRefreshing()

        service.getHome { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        }
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

    func completeWithFailure(_ error: Error) {
        completions[0](.failure(error))
    }
}

// Test

class HomeTableViewControllerTests: XCTestCase {
    func test_initShouldNotPerformAnyRequest() {
        let (_, service) = makeSUT()

        XCTAssertEqual(service.getHomeCallsCount, 0)
    }

    func test_showLoadingOnRender() {
        let (sut, _) = makeSUT()

        sut.render()

        XCTAssertTrue(sut.isRefreshing)
    }

    func test_hideLoadingAfterFailure() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithFailure(anyError)

        XCTAssertFalse(sut.isRefreshing)
    }


    // MARK: Helpers

    private var anyError: NSError {
        NSError(domain: UUID().uuidString, code: 0, userInfo: nil)
    }

    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (HomeTableViewController, HomeLoaderSpy) {
        let service = HomeLoaderSpy()
        let sut = HomeTableViewController(service: service)

        trackForMemoryLeak(sut, file: file, line: line)
        trackForMemoryLeak(service, file: file, line: line)

        return (sut, service)
    }

    private func trackForMemoryLeak(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {

        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}

extension HomeTableViewController {
    func render() {
        beginAppearanceTransition(true, animated: false)
    }

    var isRefreshing: Bool {
        refreshControl?.isRefreshing == true
    }
}
