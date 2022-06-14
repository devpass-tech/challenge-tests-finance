import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    typealias Sut = FinanceService
    
    func test_FetchHomeData_URLValidation() throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { url, _ in
            callOrder.append("performRequest called \(url)")
        }
        
        // when
        sut.fetchHomeData { _ in
            callOrder.append("fetchHomeData não deveria ser chamado")
        }
        
        // then
        XCTAssertEqual(callOrder, ["performRequest called \(fields.urlExpected)"])
    }
    
    func test_FetchHomeData_WithSuccess() throws {
        try fetchHomeData(whenApiReturns: homeDataJsonData) { homeData in
            XCTAssertEqual(homeData, .fixture())
        }
    }
    
    func test_FetchHomeData_WithInvalidData() throws {
        try fetchHomeData(whenApiReturns: Data()) { homeData in
            XCTAssertNil(homeData)
        }
    }
    
    func test_FetchHomeData_WithNullableData() throws {
        try fetchHomeData(whenApiReturns: nil) { homeData in
            XCTAssertNil(homeData)
        }
    }
    
    func test_FetchContactList_URLValidation() throws {
        //given
        var callOrder = [String]()
        let (sut, fields) = try makeSut(customUrl: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")
        fields.networkClient.performRequestImpl = { url, _ in
            callOrder.append("performRequest called \(url)")
        }
        
        // when
        sut.fetchContactList { _ in
            callOrder.append("fetchContactList não deveria ser chamado")
        }
        
        // then
        XCTAssertEqual(callOrder, ["performRequest called \(fields.urlExpected)"])
    }
    
    func test_FetchContactList_WithSucess() throws {
        try fetchContactList(whenApiReturns: contactListJsonData, shouldValidateUsing: { contactList in
            XCTAssertEqual(contactList, [.fixture()])
        })
    }
    
    func test_FetchContactList_WithInvalidData() throws {
        try fetchContactList(whenApiReturns: Data(), shouldValidateUsing: { contactList in
            XCTAssertNil(contactList)
        })
    }
    
    func test_FetchContactList_WithNullableData() throws {
        try fetchContactList(whenApiReturns: nil) { contactList in
            XCTAssertNil(contactList)
        }
    }
}

private extension FinanceServiceTests {
    func fetchHomeData(
        whenApiReturns data: Data?,
        shouldValidateUsing validation: @escaping (HomeData?) -> Void
    ) throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            callOrder.append("performRequest called")
            completion(data)
        }
        
        // when
        sut.fetchHomeData { homeData in
            callOrder.append("fetchHomeData called")
            validation(homeData)
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "fetchHomeData called"
        ])
    }
    
    func fetchContactList(
        whenApiReturns data: Data?,
        shouldValidateUsing validation: @escaping ([Contact]?) -> Void
    ) throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            callOrder.append("performRequest called")
            completion(data)
        }
        
        // when
        sut.fetchContactList { contactList in
            callOrder.append("fetchContactList called")
            validation(contactList)
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "fetchContactList called"
        ])
    }
    
    func makeSut(
        customUrl: String = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    ) throws -> (sut: Sut, (networkClient: NetworkClientMock, urlExpected: URL)) {
        let networkClient = NetworkClientMock()
        let sut = Sut(networkClient: networkClient)
        let urlExpected = try XCTUnwrap(URL(string: customUrl))
        
        addTeardownBlock { [weak sut, weak networkClient] in
            XCTAssertNil(sut)
            XCTAssertNil(networkClient)
        }
        return (sut, (networkClient, urlExpected))
    }
}

extension HomeData {
    static func fixture(
        balance: Float = 15459.27,
        savings: Float = 1000,
        spending: Float = 500,
        activity: [Activity] = [.fixture()]
    ) -> HomeData {
        .init(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity
        )
    }
}

extension Activity {
    static func fixture(
        name: String = "Mall",
        price: Float = 100,
        time: String = "8:57 AM"
    ) -> Activity {
        .init(
            name: name,
            price: price,
            time: time
        )
    }
}

extension Contact {
    static func fixture(
        name: String = "Ronald Robertson",
        phone: String = "+55 (11) 99999-9999"
    ) -> Contact {
        .init(
            name: name,
            phone: phone
        )
    }
}
