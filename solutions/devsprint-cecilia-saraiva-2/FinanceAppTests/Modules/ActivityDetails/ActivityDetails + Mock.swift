//
//  ActivityDetails + Mock.swift
//  FinanceAppTests
//
//  Created by Leonardo Almeida on 22/08/22.
//

import Foundation
@testable import FinanceApp

extension ActivityDetails {
    static func mock() -> Self {
        return ActivityDetails(name: "NameTest",
                               price: 0.0,
                               category: "CategoryTest",
                               time: "TimeTest")
    }
}
