import Foundation

protocol HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}

extension FinanceService: HomeServiceProtocol {}

#if DEBUG
final class HomeServiceStub: HomeServiceProtocol {
    init() {}
    
    static var dataToBeReturned: HomeData?
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        completion(dataToBeReturned)
    }
}
#endif
