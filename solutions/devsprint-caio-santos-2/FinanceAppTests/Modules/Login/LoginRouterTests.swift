//
//  LoginRouterTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 22/03/22.
//

import XCTest
@testable import FinanceApp

class LoginRouterTests: XCTestCase {

    private var sut: LoginRouter?
    
    override func setUpWithError() throws {
        sut = LoginRouter()
        configureSUT()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_showCreateAccountView_ShouldPushToCreateAccountController() throws {
        let sut = try XCTUnwrap(sut)
        let navigationController = try XCTUnwrap(sut.viewController?.navigationController)
        XCTAssertEqual(navigationController.viewControllers.count, 1)

        sut.showCreateAccountView()

        executeAsyncBlock {
            XCTAssertEqual(navigationController.viewControllers.count, 2)
            XCTAssertTrue(navigationController.viewControllers.last is CreateAccountViewController)
        }
    }
    
    func test_showHomeView_ShouldSetHomeViewControllerAsRoot() throws {
        let sut = try XCTUnwrap(sut)
        let navigationController = try XCTUnwrap(sut.viewController?.navigationController)
        navigationController.pushViewController(UIViewController(), animated: false)
        XCTAssertEqual(navigationController.viewControllers.count, 2)

        sut.showHomeView()
        
        executeAsyncBlock(block: {
            XCTAssertEqual(navigationController.viewControllers.count, 1)
            XCTAssertTrue(navigationController.viewControllers.last is TabBarController)
        })
    }
    
    // MARK: - Private Methods
    
    private func configureSUT() {
        let viewController = UIViewController()
        let _ = UINavigationController(rootViewController: viewController)
        sut?.viewController = viewController
    }
    
}
