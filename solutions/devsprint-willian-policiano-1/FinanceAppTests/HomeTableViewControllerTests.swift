import XCTest
import Core
import UIKit

// SUT
class BalanceCell: UITableViewCell {

}

class HomeTableViewController: UITableViewController {
    private let service: HomeLoader

    init(service: HomeLoader) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(getHome), for: .valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        refreshControl?.beginRefreshing()
        getHome()
    }

    @objc
    func getHome() {
        service.getHome { [weak self] result in
            self?.refreshControl?.endRefreshing()

            switch result {
            case .success: break
            case .failure:
                let alert = UIAlertController(
                    title: "Ops!",
                    message: "Algo de errado aconteceu. Tente novamente.",
                    preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
                alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default))

                self?.present(alert, animated: true)
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        BalanceCell()
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

    func completeWithSuccess(_ data: Home) {
        completions[0](.success(data))
    }
}

// Test

class HomeTableViewControllerTests: XCTestCase {
    func test_shouldRequestProperly() {
        let (sut, service) = makeSUT()

        XCTAssertEqual(service.getHomeCallsCount, 0)

        sut.render()

        XCTAssertEqual(service.getHomeCallsCount, 1)

        sut.pullToRefresh()

        XCTAssertEqual(service.getHomeCallsCount, 2)

        sut.pullToRefresh()

        XCTAssertEqual(service.getHomeCallsCount, 3)
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

    func test_showsErrorDialogOnFailure() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithFailure(anyError)

        XCTAssertEqual(sut.presentedError?.title, "Ops!")
        XCTAssertEqual(sut.presentedError?.message, "Algo de errado aconteceu. Tente novamente.")
        XCTAssertEqual(sut.presentedError?.preferredStyle, .alert)

        let actions = sut.presentedError?.actions

        XCTAssertEqual(actions?.count, 2)
        XCTAssertEqual(actions?[0].title, "Cancel")
        XCTAssertEqual(actions?[1].title, "Tentar novamente")
        XCTAssertEqual(actions?[0].style, .destructive)
        XCTAssertEqual(actions?[1].style, .default)
    }

    func test_doesNotShowErrorDialogOnSuccess() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithSuccess(Home(balance: 123, savings: 321, spending: 213))

        XCTAssertNil(sut.presentedError)
    }

    func test_showBalanceOnSuccess() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithSuccess(anyHomeData)

        XCTAssertNotNil(sut.balanceCell(at: 0))
    }

    // MARK: Helpers

    private var anyHomeData: Home {
        Home(balance: 123.5, savings: 0.9, spending: 12.05)
    }

    private var anyError: NSError {
        NSError(domain: UUID().uuidString, code: 0, userInfo: nil)
    }

    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (TestableHomeTableViewController, HomeLoaderSpy) {
        let service = HomeLoaderSpy()
        let sut = TestableHomeTableViewController(service: service)

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

class TestableHomeTableViewController: HomeTableViewController {
    private(set) var presentedViewControllers: [UIViewController] = []

    var isRefreshing: Bool {
        refreshControl?.isRefreshing == true
    }

    var presentedError: UIAlertController? {
        presentedViewControllers.last as? UIAlertController
    }

    func render() {
        beginAppearanceTransition(true, animated: false)
    }

    func pullToRefresh() {
        refreshControl?.sendActions(for: .valueChanged)
    }

    func balanceCell(at row: Int) -> BalanceCell? {
        tableView(tableView, cellForRowAt: IndexPath(row: row, section: 0)) as? BalanceCell
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedViewControllers.append(viewControllerToPresent)
    }
}
