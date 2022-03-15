//
//  ClassIdentifierTests.swift
//  FinanceAppTests
//
//  Created by pedro tres on 15/03/22.
//

import XCTest
@testable import FinanceApp

class ClassIdentifierTests: XCTestCase {
    
    func testActivityCellViewIdentifier_sucess() {
        let identifier = ActivityCellView.classIdentifier()
        XCTAssertEqual(identifier, "ActivityCellView")
    }
        
    func testContactCellViewIdentifier_sucess() {
        let identifier = ContactCellView.classIdentifier()
        XCTAssertEqual(identifier, "ContactCellView")
    }
    
    func testUITableViewCellIdentifier_sucess() {
        let identifier = UITableViewCell.classIdentifier()
        XCTAssertEqual(identifier, "UITableViewCell")
    }
}
