//
//  FinanceApp.swift
//  FinanceApp
//
//  Created by Willian Policiano on 29/03/22.
//

import UIKit

class FinanceCell: UITableViewCell {
    let titleLabel = UILabel()
    let valueLabel = UILabel()

    func display(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}

