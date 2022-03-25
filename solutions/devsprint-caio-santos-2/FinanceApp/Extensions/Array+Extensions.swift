//
//  Array+Extensions.swift
//  FinanceApp
//
//  Created by Caio Santos on 24/03/22.
//

/// Define the potential error cases.
enum EvenNumberError: Error {
    case emptyArray
}

extension Array where Element == Int {
    func evenNumbers() -> Result<[Int], EvenNumberError> {
        /// If the given collection is empty, return a failure instead.
        guard !self.isEmpty else {
            return .failure(.emptyArray)
        }

        /// The collection has items, fetch all even numbers.
        let evenNumbers = self.filter { number in number % 2 == 0 }
        return .success(evenNumbers)
    }
}
