//
//  Activity.swift
//  FinanceApp
//
//  Created by Leonardo Almeida on 19/08/22.
//

import Foundation

struct Activity: Decodable {
    let name: String
    let price: Float
    let time: String
}

extension Activity {

    func formattedInfo() -> String {

        return "$\(price) • \(time)"
    }
}
