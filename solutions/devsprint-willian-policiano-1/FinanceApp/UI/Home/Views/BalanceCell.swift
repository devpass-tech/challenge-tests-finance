//
//  BalanceCell.swift
//  FinanceApp
//
//  Created by Willian Policiano on 29/03/22.
//

import UIKit

class BalanceCell: UITableViewCell {
    let valueLabel = UILabel()

    func display(value: String) {
        valueLabel.text = value
    }
}
