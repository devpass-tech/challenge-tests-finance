//
//  Strings+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 18/08/22.
//

import XCTest
@testable import FinanceApp

final class StringsExtensionsTests: XCTestCase {
    
    func testRemovingSpaceWhenThereIsSpaceInTheMiddle() {
        let stringWithSpace = "tes te"
        let stringNoSpace = "teste"
        
        let stringSpace = stringWithSpace.removingSpaces()
        
        XCTAssertEqual(stringSpace, stringNoSpace)
        
    }
    
    func testRemovingSpaceWhenThereIsSpaceInTheEnd() {
        let stringWithSpace = "teste  "
        let stringNoSpace = "teste"
        
        let stringSpace = stringWithSpace.removingSpaces()
        
        XCTAssertEqual(stringSpace, stringNoSpace)
    }
    
    func testRemovingSpaceWhenThereIsSpaceInTheStart() {
        let stringWithSpace = " teste"
        let stringNoSpace = "teste"
        
        let stringSpace = stringWithSpace.removingSpaces()
        
        XCTAssertEqual(stringSpace, stringNoSpace)
    }
    
    func testRemovingSpaceWhenThereIsNoSpace() {
        let stringNoSpace1 = "teste"
        let stringNoSpace2 = "teste"
        
        let stringSpace = stringNoSpace1.removingSpaces()
        
        XCTAssertEqual(stringSpace, stringNoSpace2)
    }

}
