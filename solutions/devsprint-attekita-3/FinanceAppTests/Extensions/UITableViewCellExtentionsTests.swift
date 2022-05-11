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
        
        XCTAssertEqual(identifier, "UITableViewCell")
        
        let activityCellIdentifier = ActivityCellView.classIdentifier()
        
        XCTAssertEqual(activityCellIdentifier, "ActivityCellView")
    }

}
