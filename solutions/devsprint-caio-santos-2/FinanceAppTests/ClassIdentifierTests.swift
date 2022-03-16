//
//  ClassIdentifierTests.swift
//  FinanceAppTests
//
//  Created by pedro tres on 15/03/22.
//

import XCTest
@testable import FinanceApp

class ClassIdentifierTests: XCTestCase {
    
    //TODO: Testar o caso que entre no guard
    func test_classIdentifier_tableViewCell_shouldReturnClassName() {
        XCTAssertEqual(ActivityCellView.classIdentifier(), "ActivityCellView")
        XCTAssertEqual(ContactCellView.classIdentifier(), "ContactCellView")
        XCTAssertEqual(UITableViewCell.classIdentifier(), "UITableViewCell")
    }
}
