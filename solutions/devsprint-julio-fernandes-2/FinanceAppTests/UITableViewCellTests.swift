//
//  UITableViewCellTests.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 20/04/22.
//

import XCTest
@testable import FinanceApp

final class UITableViewCellTests: XCTestCase {
    func test_classIdentifier_should_be_return_CellView() {
        var sut: String = ActivityCellView.classIdentifier()
        XCTAssertEqual(sut, "ActivityCellView")
        
        sut = ContactCellView.classIdentifier()
        XCTAssertEqual(sut, "ContactCellView")
    }
}
