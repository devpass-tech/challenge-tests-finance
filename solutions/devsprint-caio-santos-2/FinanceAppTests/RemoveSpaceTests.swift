//
//  removeSpaceTests.swift
//  FinanceAppTests
//
//  Created by Daniel Washington Ignacio on 15/03/22.
//

import Foundation
import XCTest

@testable import FinanceApp

class RemoveSpaceTests: XCTestCase {
    
    func test_RemoveSpace_ReciveWithSpaceAndRemove() {
        XCTAssertEqual("My Name".removingSpaces() , "MyName" )
    }
    
    func test_RemoveSpace_ReciveWithNoSpace(){
        XCTAssertEqual("DanielWashingtonIgnacio".removingSpaces() , "DanielWashingtonIgnacio" )
    }
    
    func test_RemoveSpace_EmptyString(){
        XCTAssertEqual("".removingSpaces() , "" )
    }
    
    //Will return a message if the test fail   
    func test_RemoveSpace_ReciveWithNoSpace_ReturnMessage(){
        XCTAssertEqual("MyName".removingSpaces() , "MyName", "Error")
    }
    
}
