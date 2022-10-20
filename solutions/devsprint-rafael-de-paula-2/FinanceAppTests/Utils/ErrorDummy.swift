//
//  ErrorDummy.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 19/10/22.
//

import Foundation

struct ErrorDummy: Error, Identifiable, Equatable {
    let id = UUID()
    var localizedDescription: String = "Error"

    init() { }
}

extension Error {
    var asErrorDummy: ErrorDummy? {
        self as? ErrorDummy
    }
}

extension NSError {
    static let dummy = NSError(domain: "dummy", code: 1, userInfo: [NSLocalizedDescriptionKey: "dummy error"])
}
