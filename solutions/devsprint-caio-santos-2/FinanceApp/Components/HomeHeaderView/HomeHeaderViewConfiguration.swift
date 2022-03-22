//
//  HomeHeaderViewConfiguration.swift
//  FinanceApp
//
//  Created by pedro tres on 21/03/22.
//

import Foundation

struct HomeHeaderViewConfiguration {
    let label : String
    let savingsValueLabel : String
    let spendingValueLabel : String
    
    init(label: String, savingsValueLabel : String, spendingValueLabel : String) {
        self.label = label
        self.savingsValueLabel = savingsValueLabel
        self.spendingValueLabel = spendingValueLabel
    }
}
