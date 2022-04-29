//
//  UITableViewCell+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCell_ExtensionsTests: XCTestCase {

    func test_classIdentifier_should_be_return_CellView() {
        var sut: String = ActivityCellView.classIdentifier()
        XCTAssertEqual(sut, "ActivityCellView")
        
        sut = ContactCellView.classIdentifier()
        XCTAssertEqual(sut, "ContactCellView")
    }

}
