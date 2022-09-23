
import Foundation

@testable import FinanceApp

final class URLSessionSpy: URLSessionProtocol {
    
    private var urlSessionData: URLSessionDataDummy
    
    init(urlSessionData: URLSessionDataDummy) {
        self.urlSessionData = urlSessionData
    }
    
    // MARK: - Properties
    
    var dataReturned: Data?
    var responseReturned: URLResponse?
    var errorReturned: Error?
    
    private(set) var dataTaskURL: URL?
    private(set) var dataTaskWasCalled: Bool = false
    private(set) var dataTaskCount: Int = 0
    
    // MARK: - Methods
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskURL = request.url
        dataTaskWasCalled = true
        dataTaskCount += 1
        
        completionHandler(dataReturned, responseReturned, errorReturned)
        
        return urlSessionData
    }
}
