//
//  StringExtensionsTest.swift
//  FinanceAppTests
//
//  Created by Emanuel Hespanhol Costa on 23/06/22.
//

import Foundation
import XCTest
@testable import FinanceApp

class StringExtensionsTest: XCTestCase {

    func testRemovingSpaces() throws {
        let name = "Emanuel Hespanhol Costa"
        let nameWithoutSpace = "EmanuelHespanholCosta"
        
        XCTAssertEqual(name.removingSpaces(), nameWithoutSpace)
    }
    
    func testRemovingManySpaces() throws {
        let name = "Emanuel     Hespanhol     Costa"
        let nameWithoutSpace = "EmanuelHespanholCosta"
        
        XCTAssertEqual(name.removingSpaces(), nameWithoutSpace)
    }
    
    func testRemovingNoSpaces() throws {
        let name = "EmanuelHespanholCosta"
        let nameWithoutSpace = "EmanuelHespanholCosta"
        
        XCTAssertEqual(name.removingSpaces(), nameWithoutSpace)
    }

}
