//
//  BalanceCell.swift
//  FinanceApp
//
//  Created by Willian Policiano on 29/03/22.
//

import UIKit

class BalanceCell: UITableViewCell {
    let valueLabel = UILabel()

    init() {
        super.init(style: .default, reuseIdentifier: nil)
        configureLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func configureLayout() {
        contentView.addSubview(valueLabel)
        valueLabel.font = .preferredFont(forTextStyle: .largeTitle)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        valueLabel.leadingAnchor
            .constraint(equalTo: contentView.leadingAnchor, constant: 16)
            .isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    func display(value: String) {
        valueLabel.text = value
    }
}
