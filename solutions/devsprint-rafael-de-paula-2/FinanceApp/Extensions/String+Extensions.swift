//
//  String+Extensions.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

extension String {

    func removingSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    static func random(length: Int = 10) -> String {
        let randomLength = Int.random(in: 1...length)
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<randomLength).map { _ in (characters.randomElement() ?? "x") })
    }
}
