import Foundation
import UIKit

protocol TransferViewDelegate: AnyObject {
    func didPressChooseContactButton()
    func didPressTransferButton()
    func amountTextChanged(_ text: String?)
}

final class TransfersView: UIView {
    weak var delegate: TransferViewDelegate?
    var isTransferButtonEnabled: Bool {
        get { transferButton.isEnabled }
        set {
            transferButton.isEnabled = newValue
            transferButton.backgroundColor = newValue ? .systemBlue : .gray
        }
    }
    var amountText: String? {
        get { amountTextField.text }
        set { amountTextField.text = newValue }
    }

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        return stackView
    }()

    private lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "$0"
        textField.font = UIFont.boldSystemFont(ofSize: 34)
        textField.textAlignment = .center
        textField.keyboardType = .numbersAndPunctuation
        textField.addTarget(self, action: #selector(amountTextChanged), for: .editingChanged)
        return textField
    }()

    private lazy var chooseContactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose contact", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(chooseContact), for: .touchUpInside)
        return button
    }()

    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Transfer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(chooseContactButton)

        addSubview(stackView)
        addSubview(transferButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            transferButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            transferButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            transferButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            transferButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }

    @objc private func chooseContact() {
        delegate?.didPressChooseContactButton()
    }

    @objc private func transfer() {
        delegate?.didPressTransferButton()
    }
    
    @objc private func amountTextChanged() {
        delegate?.amountTextChanged(amountTextField.text)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
