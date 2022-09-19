protocol FinanceServiceProtocol: FinanceServiceHomeProtocol, FinanceServiceActivityDetailsProtocol, FinanceServiceContactListProtocol, FinanceServiceUserProfileProtocol, FinanceServiceTransferProtocol {}

protocol FinanceServiceHomeProtocol {
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}

protocol FinanceServiceActivityDetailsProtocol {
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)
}

protocol FinanceServiceContactListProtocol {
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void)
}

protocol FinanceServiceUserProfileProtocol {
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void)
}

protocol FinanceServiceTransferProtocol {
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void)
}
