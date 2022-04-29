//
//  HomeViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewControllerTests: XCTestCase {
    
    static var presentedViewController: UIViewController?
    var sut: HomeViewController?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_viewDidLoad() throws {
        _ = try UINavigationController(rootViewController: XCTUnwrap(sut))
        
        XCTAssertNil(sut?.navigationItem.rightBarButtonItem)
        
        sut?.viewDidLoad()
        
        XCTAssertNotNil(sut?.navigationItem.rightBarButtonItem)
    }
    
    func test_loadView() {
        sut?.loadView()
        XCTAssertTrue(sut?.view is HomeView)
    }
    
    func test_openProfile() {
        sut?.openProfile()
        let nav = HomeViewControllerTests.presentedViewController as? UINavigationController
        XCTAssertTrue(nav?.topViewController is UserProfileViewController)
    }
    
    func test_didSelectActivity() throws {
        let sut = try XCTUnwrap(sut)
        let navigation = NavigationControllerDummy(rootViewController: sut)
        
        sut.didSelectActivity()
        
        XCTAssertEqual(navigation.viewControllers.count, 2)
        XCTAssertTrue(navigation.viewControllers.last is ActivityDetailsViewController)
    }
}

extension HomeViewController {
    open override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        HomeViewControllerTests.presentedViewController = viewControllerToPresent
    }
}

final class NavigationControllerDummy: UINavigationController {
    
    private(set) var pushViewControllerToBeReturned: UIViewController?
    private(set) var pushViewControllerCalled = false
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerToBeReturned = viewController
        pushViewControllerCalled = true
        super.pushViewController(viewController, animated: false)
    }
}
