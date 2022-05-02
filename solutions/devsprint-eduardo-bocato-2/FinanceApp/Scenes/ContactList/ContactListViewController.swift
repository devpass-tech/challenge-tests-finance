import UIKit

final class ContactListViewController: UIViewController {
    var contactList: [Contact] = []
    
    var onSelectedContact: (Contact) -> Void
    
    init(onSelectedContact: @escaping (Contact) -> Void) {
        self.onSelectedContact = onSelectedContact
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let customView = ContactListView(
            dataSource: self
        )
        customView.delegate = self
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FinanceService.fetchContactList { [weak self] result in
            guard let contacts = try? result.get() else { return }
            self?.contactList = contacts
            DispatchQueue.main.async {
                (self?.view as? ContactListView)?.reloadData()
            }
        }
    }
}

extension ContactListViewController: UITableViewDataSource {
    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return contactList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.className, for: indexPath) as! ContactCellView
        let contact = contactList[indexPath.row]
        cell.configure(
            name: contact.name,
            phone: PhoneNumberFormatter.format(contact.phone)
        )
        return cell
    }
}

extension ContactListViewController: ContactListViewDelegate {
   func didSelectItemAt(_ indexPath: IndexPath) {
       let selectedContact = contactList[indexPath.row]
       let alert = UIAlertController(
        title: nil,
        message: "\(selectedContact.name) was selected!",
        preferredStyle: .actionSheet
       )
       let okAction: UIAlertAction = .init(
        title: "Ok",
        style: .default,
        handler: { [weak self] _ in
            self?.onSelectedContact(selectedContact)
            self?.dismiss(animated: true)
        }
       )
       alert.addAction(okAction)
       present(alert, animated: true)
   }
}
