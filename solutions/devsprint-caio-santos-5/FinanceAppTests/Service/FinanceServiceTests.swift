import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    typealias Sut = FinanceService
    
    func test_FetchHomeData_WhenURLMakerReturnNil_ShouldReturnNil() throws {
        // given
        var callOrder = [String]()
        let urlMaker: Sut.URLMaker = { urlString in
            callOrder.append("performRequest called with \(urlString)")
            return nil
        }
        let sut = Sut(networkClient: NetworkClientMock(), urlMaker: urlMaker)
        
        // when
        sut.fetchHomeData { homeData in
            callOrder.append("fetchHomeData called receiving \(String(describing: homeData))")
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called with https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json",
            "fetchHomeData called receiving nil"
        ])
    }
    
    func test_FetchHomeData_WhenNotCallCompletionClient_ShouldNotReturnData() throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion /* não chamar completion */ in
            callOrder.append("performRequest called")
        }
        
        // when
        sut.fetchHomeData { _ in
            XCTFail("quando a completion do networkClient não for chamada, fetchHomeData também não deveria ser chamado")
        }
        
        // then
        XCTAssertEqual(callOrder, ["performRequest called"])
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

    func test_FetchActivityDetails_URLValidation() throws {
        //GIVEN
        var callOrder = [String]()
        let (sut, fields) = try makeSut(customUrl: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")
        fields.networkClient.performRequestImpl = { url, _ in
            callOrder.append("performRequest called \(url)")
        }

        // when
            sut.fetchActivityDetails { _ in
                callOrder.append("fetchActivityDetails não deveria ser chamado")
            }

        // then
        XCTAssertEqual(callOrder, ["performRequest called \(fields.urlExpected)"])
    }

    func test_FetchActivityDetails_WithSuccess() throws {
        try fetchActivityDetails(whenApiReturns: ActivityDetailsJsonData,  shouldValidateUsing: { activityDetails in
            XCTAssertEqual(activityDetails, .fixture())
        })
    }

    func test_FetchActivityDetails_WithInvalidData() throws {
        try fetchActivityDetails(whenApiReturns: Data(), shouldValidateUsing: { activityDetails in
            XCTAssertNil(activityDetails)
        })

    }

    func test_FetchActivityDetails_WithNullableData() throws {
        try fetchActivityDetails(whenApiReturns: nil, shouldValidateUsing: { activityDetails in
            XCTAssertNil(activityDetails)
        })
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
    
    // MARK: transferAmount_method
    
    func test_TransferAmount_URLValidation() throws {
        //given
        var callOrder = [String]()
        let (sut, fields) = try makeSut(customUrl: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json")
        fields.networkClient.performRequestImpl = { url, _ in
            callOrder.append("performRequest called \(url)")
        }
        
        // when
        sut.transferAmount { _ in
            callOrder.append("transferAmount não deveria ser chamado")
        }
        
        // then
        XCTAssertEqual(callOrder, ["performRequest called \(fields.urlExpected)"])
    }
    
    func test_TransferAmount_WithSucess() throws {
        try transferAmount(whenApiReturns: transferResultJsonData, shouldValidateUsing: { transferAmount in
            XCTAssertEqual(transferAmount, .fixture())
        })
    }
    
    func test_TransferAmount_WithInvalidData() throws {
        try transferAmount(whenApiReturns: Data(), shouldValidateUsing: { transferAmount in
            XCTAssertNil(transferAmount)
        })
    }
    
    func test_TransferAmount_WithNullableData() throws {
        try transferAmount(whenApiReturns: nil) { transferAmount in
            XCTAssertNil(transferAmount)
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

    func fetchActivityDetails(
        whenApiReturns data: Data?,
        shouldValidateUsing validation: @escaping (ActivityDetails?) -> Void
    ) throws {
        //given
        var callOrder = [String]()
        let (sut, fields) = try makeSut(customUrl: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")
        fields.networkClient.performRequestImpl = {_, completion in
            callOrder.append("performRequest called")
            completion(data)
        }

        //when
        sut.fetchActivityDetails { activityDetails in
            callOrder.append("activityDetails called")
            validation(activityDetails)
        }

        //then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "activityDetails called"
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
    
    func transferAmount(
        whenApiReturns data: Data?,
        shouldValidateUsing validation: @escaping (TransferResult?) -> Void
    ) throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            callOrder.append("performRequest called")
            completion(data)
        }
        
        // when
        sut.transferAmount { transferAmount in
            callOrder.append("transferAmount called")
            validation(transferAmount)
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "transferAmount called"
        ])
    }
    
    func makeSut(customUrl: String = "www.devpass.com") throws -> (sut: Sut, (networkClient: NetworkClientMock, urlExpected: URL)) {
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
