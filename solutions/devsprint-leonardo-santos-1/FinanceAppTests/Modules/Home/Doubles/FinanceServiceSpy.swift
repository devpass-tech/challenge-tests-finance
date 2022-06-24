@testable import FinanceApp

final class FinanceServiceSpy: FinanceServiceProtocol {
    
    private(set) var fetchHomeDataTriggered: Bool = false
    private(set) var fecthHomeDataCount = 0
    var fetchHomeDataReturned: HomeData?
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataTriggered = true
        fecthHomeDataCount += 1
        completion(fetchHomeDataReturned)
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {}
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
}
