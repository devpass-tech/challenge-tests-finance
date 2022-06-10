@testable import FinanceApp
import Foundation
import XCTest

final class NetworkClientMock: NetworkClientProtocol {
    var performRequestImpl: (_ url: URL, _ completion: @escaping (Data?) -> ()) -> Void = { _, _ in
        XCTFail("performRequestImpl não foi implementada")
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestImpl(url, completion)
    }
}
