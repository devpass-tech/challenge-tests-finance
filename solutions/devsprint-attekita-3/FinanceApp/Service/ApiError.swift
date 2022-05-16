//
//  ApiError.swift
//  FinanceApp
//
//  Created by Matheus Lenke on 16/05/22.
//

import Foundation

public enum ApiError: Error {
    case requestFailed(Error)
    case invalidURL
    case errorNetwork
    case noData
    case parseError
    case error(String)
}
