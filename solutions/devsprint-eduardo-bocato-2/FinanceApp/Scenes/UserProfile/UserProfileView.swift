import UIKit

protocol UserProfileViewProtocol where Self: UIView {
    func setData(_ data: UserProfileViewData)
}

final class UserProfileView: UIView, UserProfileViewProtocol {
    private var data: UserProfileViewData?
    
    private lazy var headerView = UserProfileHeaderView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 232)
        tableView.tableHeaderView = headerView
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: UserProfileViewData) {
        self.data = data
        headerView.setData(data)
        tableView.reloadData()
    }
}

extension UserProfileView: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 3
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")

        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = data?.phone ?? "+55 (11) 99999-9999"
        case 1:

            cell.textLabel?.text = "E-mail"
            cell.detailTextLabel?.text = data?.email ?? "user@devpass.com"
        case 2:

            cell.textLabel?.text = "Address"
            cell.detailTextLabel?.text = data?.address ?? "Rua Bela Cintra, 495"
        default:
            break
        }
        return cell
    }

    func tableView(_: UITableView, titleForHeaderInSection _: Int) -> String? {
        return "My account"
    }
}
