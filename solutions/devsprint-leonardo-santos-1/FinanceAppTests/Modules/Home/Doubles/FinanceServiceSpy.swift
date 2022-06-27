@testable import FinanceApp

final class FinanceServiceHomeDataSpy: FinanceServiceHomeDataProtocol {
    
    private(set) var fetchHomeDataTriggered: Bool = false
    private(set) var fecthHomeDataCount = 0
    var fetchHomeDataReturned: HomeData?
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataTriggered = true
        fecthHomeDataCount += 1
        completion(fetchHomeDataReturned)
    }
}
