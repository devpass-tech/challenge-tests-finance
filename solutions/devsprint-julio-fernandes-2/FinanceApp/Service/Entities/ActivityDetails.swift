//
//  ActivityDetails.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import Foundation

struct ActivityDetails: Decodable {

    let name: String
    let price: Float
    let category: String
    let time: String
}
