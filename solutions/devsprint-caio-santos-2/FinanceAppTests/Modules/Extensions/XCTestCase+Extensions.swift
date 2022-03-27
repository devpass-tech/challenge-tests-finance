//
//  XCTestCase+Extensions.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 23/03/22.
//

import XCTest

extension XCTestCase {
    func executeAsyncBlock(timeout: TimeInterval = 10,
                           deadline: DispatchTime = .now(),
                           block: @escaping () -> Void) {
        let expectation = self.expectation(description: "Test async condition")
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            expectation.fulfill()
            block()
        }
        waitForExpectations(timeout: timeout, handler: nil)
    }
}
