import Foundation
@testable import FinanceApp
import XCTest

final class FinanceServiceMock: FinanceServiceProtocol {
    var fetchHomeDataImpl: (_ completion: @escaping (HomeData?) -> Void) -> Void = { _ in
        XCTFail("fetchHomeDataImpl not implemented")
    }
    var fetchActivityDetailsImpl: (_ completion: @escaping (ActivityDetails?) -> Void) -> Void = { _ in
        XCTFail("fetchActivityDetailsImpl not implemented")
    }
    var fetchContactListImpl: (_ completion: @escaping ([Contact]?) -> Void) -> Void = { _ in
        XCTFail("fetchContactListImpl not implemented")
    }
    var transferAmountImpl: (_ completion: @escaping (TransferResult?) -> Void) -> Void = { _ in
        XCTFail("transferAmountImpl not implemented")
    }
    var fetchUserProfileImpl: (_ completion: @escaping (UserProfile?) -> Void) -> Void = { _ in
        XCTFail("fetchUserProfileImpl not implemented")
    }
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetchHomeDataImpl(completion)
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        fetchActivityDetailsImpl(completion)
    }
    
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {
        fetchContactListImpl(completion)
    }
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
        transferAmountImpl(completion)
    }
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        fetchUserProfileImpl(completion)
    }
}
