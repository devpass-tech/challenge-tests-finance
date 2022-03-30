//
//  HomeViewModel.swift
//  FinanceApp
//
//  Created by Willian Policiano on 29/03/22.
//

import Core
import Foundation

struct HomeViewModel {
    enum Row {
        case untitled(value: String)
        case titled(title: String, value: String)
    }

    let rows: [Row]

    init() {
        rows = []
    }

    init(home: Home) {
        let formater = NumberFormatter()
        formater.maximumFractionDigits = 2
        formater.numberStyle = .currency
        formater.currencyCode = "USD"

        var rows = [Row]()

        if let balance = formater.string(from: home.balance as NSDecimalNumber) {
            rows.append(.untitled(value: balance))
        }

        if let savings = formater.string(from: home.savings as NSDecimalNumber) {
            rows.append(.titled(title: "Savings", value: savings))
        }

        if let spending = formater.string(from: home.spending as NSDecimalNumber) {
            rows.append(.titled(title: "Spending", value: spending))
        }

        self.rows = rows
    }
}
