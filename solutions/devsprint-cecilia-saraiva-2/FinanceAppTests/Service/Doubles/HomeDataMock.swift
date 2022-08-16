//
//  HomeDataMock.swift
//  FinanceAppTests
//
//  Created by Vitor Conceicao on 16/08/22.
//

import Foundation

struct HomeDataMock: Codable {
    let balance: Float
    let savings: Float
    let spending: Float
    let activity: [ActivityMock]
}

struct ActivityMock: Codable {
    let name: String
    let price: Float
    let time: String
}
