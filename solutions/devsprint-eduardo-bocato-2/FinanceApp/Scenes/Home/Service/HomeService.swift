import Foundation

protocol HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}
extension FinanceService: HomeServiceProtocol {}

#if DEBUG
final class HomeServiceStub: HomeServiceProtocol {
    static var homeDataToBeReturned: HomeData? = nil
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        completion(homeDataToBeReturned)
    }
}

struct HomeServiceDummy: HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {}
}
#endif
