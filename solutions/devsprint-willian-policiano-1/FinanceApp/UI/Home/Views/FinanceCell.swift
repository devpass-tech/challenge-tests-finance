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

    init() {
        super.init(style: .default, reuseIdentifier: nil)
        configureLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func configureLayout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)

        valueLabel.font = .preferredFont(forTextStyle: .headline)
        valueLabel.textColor = .gray

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    func display(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}

