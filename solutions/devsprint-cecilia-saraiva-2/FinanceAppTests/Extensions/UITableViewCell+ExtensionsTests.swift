//
//  UITableViewCell+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 23/08/22.
//

import XCTest
@testable import FinanceApp

final class DummyTableViewCell: UITableViewCell {}

final class UITableViewCell_ExtensionsTests: XCTestCase {
    
    func testClassIdentifier() {
        
        let classIdentifier = DummyTableViewCell.classIdentifier()
        
        let test = "DummyTableViewCell"
        
        XCTAssertEqual(classIdentifier, test)
    }

}
