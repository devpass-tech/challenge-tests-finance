
import Foundation

@testable import FinanceApp

final class NetworkSessionSpy: NetworkSessionProtocol {
    
    // MARK: - Properties
    
    var completionData: Data?
    var shouldFailTask = false
    private(set) var url: URL?
    private(set) var wasCalled: Bool = false
    private(set) var dataTaskCount: Int = 0
    
    // MARK: - Methods
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        url = request.url
        wasCalled = true
        dataTaskCount += 1
        
        if shouldFailTask {
            completionHandler(nil, nil, nil)
        } else {
            completionHandler(completionData, nil, nil)
        }
        
        return URLSession.shared.dataTask(with: request)
    }
}
