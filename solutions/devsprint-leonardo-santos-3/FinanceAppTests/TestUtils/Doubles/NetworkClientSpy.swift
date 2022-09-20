import Foundation

@testable import FinanceApp

class NetworkClientSpy: NetworkClientProtocol {
    // MARK: Properties
    var url: URL?
    var completionData: Data?
    var performRequestCount: Int = 0

    // MARK: Methods
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        performRequestCount += 1
        completion(completionData)
    }
}
