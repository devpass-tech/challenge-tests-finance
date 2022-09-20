import Foundation

@testable import FinanceApp

final class NetworkClientSpy: NetworkClientProtocol {
    // MARK: Properties
    var completionData: Data?
    private(set) var url: URL?
    private(set)var performRequestCount: Int = 0

    // MARK: Methods
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        self.url = url
        performRequestCount += 1
        completion(completionData)
    }
}
