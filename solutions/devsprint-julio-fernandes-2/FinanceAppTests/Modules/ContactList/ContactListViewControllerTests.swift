//
//  ContactListViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class ContactListViewControllerTests: XCTestCase {
    
    var sut: ContactListViewController?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactListViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_loadView() {
        sut?.loadView()
        XCTAssertTrue(sut?.view is ContactListView)
    }
}
