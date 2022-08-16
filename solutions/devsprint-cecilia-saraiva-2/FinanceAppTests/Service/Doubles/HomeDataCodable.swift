//
//  HomeDataMock.swift
//  FinanceAppTests
//
//  Created by Vitor Conceicao on 16/08/22.
//

import Foundation

struct HomeDataCodable: Codable {
    let balance: Float
    let savings: Float
    let spending: Float
    let activity: [ActivityCodable]
}

struct ActivityCodable: Codable {
    let name: String
    let price: Float
    let time: String
}
