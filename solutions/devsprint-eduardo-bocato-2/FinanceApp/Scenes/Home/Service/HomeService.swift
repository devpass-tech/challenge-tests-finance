import Foundation

protocol HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}

extension FinanceService: HomeServiceProtocol {}

#if DEBUG
final class FinanceServiceStub: HomeServiceProtocol {
    static var homeDataToBeReturned: HomeData? = nil
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        completion(homeDataToBeReturned)
    }
}
#endif
