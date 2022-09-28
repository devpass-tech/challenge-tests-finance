import Foundation

@testable import FinanceApp

final class FinanceHomeServiceSpy: FinanceServiceHomeProtocol {
    var fetchHomeDataCalled: Bool = false
    var fetchHomeDataCompletionDataToBeReturned: HomeData?
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataCalled = true
        
        completion(fetchHomeDataCompletionDataToBeReturned)
    }
    
}
