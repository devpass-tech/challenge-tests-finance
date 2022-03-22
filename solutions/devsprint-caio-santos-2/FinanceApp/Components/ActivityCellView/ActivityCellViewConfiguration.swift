//
//  ActivityCellViewConfiguration.swift
//  FinanceApp
//
//  Created by pedro tres on 21/03/22.
//

import Foundation

struct ActivityCellViewConfiguration {
    let image: String
    let name: String
    let information: String
    
    init(image: String, name: String, information: String) {
        self.image = image
        self.name = name
        self.information = information
    }
}
