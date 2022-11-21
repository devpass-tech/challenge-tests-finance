import Foundation

final class URLSessionSpy: URLSession {
    
    private(set) var dataTaskCalled: Bool = false
    private(set) var dataTaskData: Data?
    private(set) var dataTaskResponse: URLResponse?
    private(set) var dataTaskError: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCalled = true
        completionHandler(dataTaskData, dataTaskResponse, dataTaskError)
        return URLSessionDataTaskSpy()
    }
    
    func setData(data: Data) {
        dataTaskData = data
    }
    
    func setResponse(response: URLResponse) {
        dataTaskResponse = response
    }
    
    func setError(error: Error) {
        dataTaskError = error
    }
}

final class URLSessionDataTaskSpy: URLSessionDataTask {
    
    override func resume() {
        
    }
}
