//
//  UITableViewCellExtentionsTests.swift
//  FinanceAppTests
//
//  Created by Matheus Lenke on 11/05/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCellExtensionsTests: XCTestCase {

    func testClassIdentifierMethod_WhenUITableViewCell_ShouldReturnIdentifier() throws {
        let identifier = UITableViewCell.classIdentifier()
        let activityCellIdentifier = ActivityCellView.classIdentifier()
        
        XCTAssertEqual(identifier, "UITableViewCell")
        XCTAssertEqual(activityCellIdentifier, "ActivityCellView")
    }

}
