//
//  ActivityTests.swift
//  FinanceAppTests
//
//  Created by Gabriela Sillis on 21/06/22.
//

import XCTest
@testable import FinanceApp

final class ActivityTests: XCTestCase {
    private let sut = Activity(name: "any_name", price: 80, time: "18000")
    
    func test_formattedInfo_shouldReturn_formattedString() {
        let expedtedString = "$80.0 • 18000"
        XCTAssertEqual(sut.formattedInfo(), expedtedString)
    }
}
