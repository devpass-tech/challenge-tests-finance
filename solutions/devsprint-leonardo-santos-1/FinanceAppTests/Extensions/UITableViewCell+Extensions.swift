//
//  UITableViewCell+Extensions.swift
//  FinanceAppTests
//
//  Created by Hellen Caroline  on 22/06/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCellTests: XCTestCase {
    
    func test_classIdentifier_shouldReturnClassName() {
        XCTAssertEqual(ActivityCellView.classIdentifier(), "ActivityCellView")
        XCTAssertEqual(ContactCellView.classIdentifier(), "ContactCellView")
    }
}
