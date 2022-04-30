//
//  TransfersViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class TransfersViewControllerTests: XCTestCase {
    
    static var presentedViewController: UIViewController?
    private var sut: TransfersViewController?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TransfersViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_loadView() {
        sut?.loadView()
        XCTAssertTrue(sut?.view is TransfersView)
    }
    
    func test_didPressChooseContactButton() {
        sut?.didPressChooseContactButton()
        let nav = TransfersViewControllerTests.presentedViewController as? UINavigationController
        XCTAssertTrue(nav?.topViewController is ContactListViewController)
    }
    
    func test_didPressTransferButton() {
        sut?.didPressTransferButton()
        let nav = TransfersViewControllerTests.presentedViewController as? UINavigationController
        XCTAssertTrue(nav?.topViewController is ConfirmationViewController)
    }
}

extension TransfersViewController {
    open override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        TransfersViewControllerTests.presentedViewController = viewControllerToPresent
    }
}
