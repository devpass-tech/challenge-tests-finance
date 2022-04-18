//
//  UITableViewCell+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Guilherme Strutzki on 07/04/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCell_ExtensionsTests: XCTestCase {

    func test_whenGettingActivityCellIdentifier_shouldReturnEquallyAsClassName() {
        let activityCellIdentifier = ActivityCellView.classIdentifier()
        XCTAssertEqual(activityCellIdentifier, "ActivityCellView")
    }
    
    func test_whenGettingContactCellIdentifier_shouldReturnEquallyAsClassName() {
        let contactCellIdentifier = ContactCellView.classIdentifier()
        XCTAssertEqual(contactCellIdentifier, "ContactCellView")
    }

}
