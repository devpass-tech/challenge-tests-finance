//
//  UITableViewCell+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Guilherme Strutzki on 07/04/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCell_ExtensionsTests: XCTestCase {

    func test_whenGettingClassIdentifier_shouldReturnEquallyAsClassName() {
        let activityCellIdentifier = ActivityCellView.classIdentifier()
        let contactCellIdentifier = ContactCellView.classIdentifier()
        
        XCTAssertEqual(activityCellIdentifier, "ActivityCellView")
        XCTAssertEqual(contactCellIdentifier, "ContactCellView")
    }

}
