//
//  removingSpacesTest.swift
//  FinanceAppTests
//
//  Created by Michelli Cristina de Paulo Lima on 20/04/22.
//

import XCTest
@testable import FinanceApp

final class removingSpacesTest: XCTestCase {

    func test_removingSpaces() throws {
       let shouldRemovingSpaces = "        É um teste"
        
        XCTAssertEqual("Éumteste", shouldRemovingSpaces.removingSpaces())
        
        
    }

}
