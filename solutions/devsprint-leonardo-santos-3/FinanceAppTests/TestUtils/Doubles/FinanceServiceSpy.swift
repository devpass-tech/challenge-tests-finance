import Foundation

@testable import FinanceApp

final class FinanceServiceSpy: FinanceServiceProtocol {
    var fetchHomeDataCalled: Bool = false
    var fetchHomeDataCompletionDataToBeReturned: HomeData?
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataCalled = true
        
        completion(fetchHomeDataCompletionDataToBeReturned)
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {}
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {}
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {}
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {}
    
}
