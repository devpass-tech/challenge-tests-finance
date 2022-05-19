//
//  UserProfileHeaderView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/01/22.
//

import UIKit

final class UserProfileHeaderView: UIView {
    
    // MARK: - Private Constants
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center

        return stackView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar-placeholder")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private let agencyLabel: UILabel = {
        let label = UILabel()
        label.text = "Agency 0001"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private let accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Account 123456-7"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private let bankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Devpass Bank"
        label.font = UIFont.systemFont(ofSize: 15)

        return label
    }()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        setupViews()
        setupConstraints()
        setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(agencyLabel)
        stackView.addArrangedSubview(accountLabel)
        stackView.addArrangedSubview(bankLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),

            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: - Extension UserProfileHeaderView
extension UserProfileHeaderView {
    func setup(with values: UserProfileHeaderConfiguration) {
        imageView.image = values.imageView
        nameLabel.text = values.name
        agencyLabel.text = values.agency
        accountLabel.text = values.account
        bankLabel.text = values.bank
    }
}
