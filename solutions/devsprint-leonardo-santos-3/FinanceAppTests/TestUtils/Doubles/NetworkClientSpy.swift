import Foundation

@testable import FinanceApp

class NetworkClientSpy: NetworkClientProtocol {
    // MARK: Properties
    var completionData: Data?
    var performRequestCount: Int = 0

    // MARK: Methods
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestCount += 1
        completion(completionData)
    }
}
