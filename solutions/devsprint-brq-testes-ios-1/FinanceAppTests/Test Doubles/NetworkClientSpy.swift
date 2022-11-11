import Foundation

@testable import FinanceApp

class NetWorkClientSpy: NetworkClientProtocol {
    
    
    private(set) var performRequestCalled: Bool = false
    private(set) var performRequestCallCount: Int = 0
    private(set) var performRequestURL: URL?
    var performRequestCompletionDataToBeReturned: Data?

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestCalled = true
        performRequestCallCount += 1
        performRequestURL = url
        completion(performRequestCompletionDataToBeReturned)
    }
    
}
