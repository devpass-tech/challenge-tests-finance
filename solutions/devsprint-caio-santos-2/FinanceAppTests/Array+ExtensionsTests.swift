//
//  Array+ExtensionsTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 24/03/22.
//

import XCTest
@testable import FinanceApp

class Array_ExtensionsTests: XCTestCase {


    func test_EvenNumbers_WithEmptyArray_ShouldReturnFailure() throws {
        let array: [Int] = []
        XCTAssertEqual(array.evenNumbers(), .failure(.emptyArray))
    }

    func test_EvenNumbers_WithArrayWhithoutEvenNumbers_ShouldReturnEmptySuccess() throws {
        let array: [Int] = [1,3,5,7,9]
        XCTAssertEqual(array.evenNumbers(), .success([]))
    }

    func test_EvenNumbers_WithArrayWhithEvenNumbers_ShouldReturnSuccess() throws {
        let array: [Int] = [1,2,3,4,5,6,7,8,9]
        XCTAssertEqual(array.evenNumbers(), .success([2,4,6,8]))
        
        switch array.evenNumbers() {
        case .success(let value):
            XCTAssertEqual(value.count, 4)
        default:
            XCTFail("")
        }
    }
}
