//
//  FinanceAppTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 30/12/21.
//

import XCTest
@testable import FinanceApp

class ActivityTests: XCTestCase {

    func testActivityFormattedInfoSuccess() throws {
        let activity: Activity = .init(name: "Teste", price: 20.9, time: "10:00")
        XCTAssertEqual(activity.formattedInfo(), "$20.9 • 10:00")
    }
    
    func testActivityFormattedInfoFailure() throws {
        let activity: Activity = .init(name: "Teste", price: 20.9, time: "10:00")
        XCTAssertNotEqual(activity.formattedInfo(), "$20.9 • 10:01")
    }
    
}
