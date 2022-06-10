//
//  HomeData.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

struct HomeData: Decodable, Equatable {
    let balance: Float
    let savings: Float
    let spending: Float
    let activity: [Activity]
}

struct Activity: Decodable, Equatable {
    let name: String
    let price: Float
    let time: String
}

extension Activity {
    func formattedInfo() -> String {
        return "$\(price) • \(time)"
    }
}
