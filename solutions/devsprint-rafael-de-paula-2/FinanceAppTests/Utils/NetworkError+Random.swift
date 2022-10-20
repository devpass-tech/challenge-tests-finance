//
//  NetworkError+Random.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 19/10/22.
//

import Foundation
@testable import FinanceApp

extension NetworkError {
    static func random() -> NetworkError {
        let allCases: [NetworkError] = [
            .errorNetwork,
            .requestFailed(ErrorDummy()),
            .noData,
            .parseError
        ]
        return allCases[Int.random(in: 0..<allCases.count)]
    }
}
