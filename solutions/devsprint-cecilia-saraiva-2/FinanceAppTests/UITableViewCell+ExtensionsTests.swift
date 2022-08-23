//
//  UITableViewCell+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 23/08/22.
//

import XCTest
@testable import FinanceApp

class DummyTableViewCell: UITableViewCell {}

class UITableViewCell_ExtensionsTests: XCTestCase {
    
    func testClassIdentifier() {
        
        let classIdentifier = DummyTableViewCell.classIdentifier()
        
        let test = "DummyTableViewCell"
        
        XCTAssertEqual(classIdentifier, test)
    }

}
