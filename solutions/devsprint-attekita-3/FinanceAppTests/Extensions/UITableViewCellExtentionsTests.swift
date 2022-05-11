//
//  UITableViewCellExtentionsTests.swift
//  FinanceAppTests
//
//  Created by Matheus Lenke on 11/05/22.
//

import XCTest
@testable import FinanceApp

class UITableViewCellExtensionsTests: XCTestCase {

    
    func testClassIdentifierMethod_WhenActivityCellView_ShouldReturnIdentifier() throws {
        let identifier = ActivityCellView.classIdentifier()
        
        XCTAssertEqual(identifier, "ActivityCellView")
    }
    
    func testClassIdentifierMethod_WhenContactCellView_ShouldReturnIdentifier() throws {
        let identifier = ContactCellView.classIdentifier()
        
        XCTAssertEqual(identifier, "ContactCellView")
    }
    
    func testClassIdentifierMethod_WhenUITableViewCell_ShouldReturnIdentifier() throws {
        let identifier = UITableViewCell.classIdentifier()
        
        XCTAssertEqual(identifier, "UITableViewCell")
    }
    
    func testClassIdentifierMethod_WhenUITableViewCell_ShouldBeNotNil() {
        let identifier = UITableViewCell.classIdentifier()
        
        XCTAssertNotNil(identifier)
    }

}
