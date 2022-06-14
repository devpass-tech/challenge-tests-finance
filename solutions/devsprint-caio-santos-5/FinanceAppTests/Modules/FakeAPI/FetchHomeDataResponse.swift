//
//  FetchHomeDataResponse.swift
//  FinanceAppTests
//
//  Created by Hyago Henrique on 14/06/22.
//

import Foundation
@testable import FinanceApp


let responseFetchHomeData = HomeData(
    balance: 15459.27,
    savings: 1000,
    spending: 500,
    activity: [
        Activity(
            name: "Mall",
            price: 100,
            time: "8:57 AM")
    ]
)
