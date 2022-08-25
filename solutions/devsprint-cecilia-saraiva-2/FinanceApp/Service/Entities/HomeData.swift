//
//  HomeData.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

struct HomeData: Codable {

    let balance: Float
    let savings: Float
    let spending: Float
    let activity: [Activity]
}

