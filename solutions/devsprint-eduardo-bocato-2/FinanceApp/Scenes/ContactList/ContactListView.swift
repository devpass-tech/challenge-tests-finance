import Foundation
import UIKit

protocol ContactListViewDelegate: AnyObject {
    func didSelectItemAt(_ indexPath: IndexPath)
}

final class ContactListView: UIView {
    static let cellSize = CGFloat(82)
    
    weak var delegate: ContactListViewDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.className)
        tableView.delegate = self
        return tableView
    }()

    init(dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.dataSource = dataSource
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

private extension ContactListView {
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        configureConstraints()
    }
    
    func addSubviews() {
        addSubview(tableView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ContactListView: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return ContactListView.cellSize
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectItemAt(indexPath)
    }
}
