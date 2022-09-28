import XCTest

@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    private let networkClientSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkClientSpy)

    func test_fetchActivityDetails_givenCorrectData_shouldReturnCorrectActivityDetails() {
        networkClientSpy.completionData = correctData

        sut.fetchActivityDetails {
            XCTAssertEqual($0, .fixture(name: "Mall", price: 100, category: "Shopping", time: "8:57 AM"))
        }

        makeDefaultTests()
    }

    func test_fetchActivityDetails_givenParseFailData_shouldReturnNil() {
        networkClientSpy.completionData = parseFailData

        sut.fetchActivityDetails {
            XCTAssertNil($0)
        }

        makeDefaultTests()
    }

    func test_fetchActivityDetails_givenNilData_shouldReturnNil() {
        networkClientSpy.completionData = nil

        sut.fetchActivityDetails {
            XCTAssertNil($0)
        }

        makeDefaultTests()
    }

    func test_fetchActivityDetails_testSingleCountAndCorrectUrlString() {
        sut.fetchActivityDetails { _ in }

        makeDefaultTests()
    }
    
    func test_fetchContactList_shouldSendCorrectURL(){
        sut.fetchContactList { _ in }

        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
        XCTAssertEqual(networkClientSpy.url?.description, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")
    }
    
    func test_fetchContactList_givenNilData_shouldReturnNil(){
        networkClientSpy.completionData = nil
        
        sut.fetchContactList { data in
            XCTAssertNil(data)
        }
        
        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
    }
    
    func test_fetchContactList_givenData_shouldReturnCorrectContactList(){
        let expectedResult = [
            Contact.fixture(name: "Fulano", phone: "55 027 939399999")
        ]
        
        networkClientSpy.completionData = correctContactListData
        
        sut.fetchContactList { result in
            XCTAssertEqual(result, expectedResult)
        }
    }
    
    func test_fetchContactList_givenInvalidData_shouldReturnNil(){
        networkClientSpy.completionData = invalidContactListData
        
        sut.fetchContactList { result in
            XCTAssertNil(result)
        }
    }

    func test_fetchHomeData_shouldPassCorrectURL(){
        sut.fetchHomeData({ _ in })
        
        XCTAssertEqual(networkClientSpy.url?.description, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")
        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
    }
    
    func test_fetchHomeData_givenNilData_shouldReturnNil(){
        networkClientSpy.completionData = nil
        
        sut.fetchHomeData({
            XCTAssertNil($0)
            XCTAssertEqual(self.networkClientSpy.performRequestCount, 1)
        })
    }
    
    func test_fetchHomeData_givenValidData_shouldReturnHomeData(){
        let expectedResult: HomeData = HomeData.fixture(balance: 100.0, savings: 0.0, spending: -300.0, activity: [Activity(name: "ifood", price: -200.0, time: "10:00 PM")])
        
        networkClientSpy.completionData = correctHomeDataData
        
        sut.fetchHomeData {
            XCTAssertEqual($0, expectedResult)
            XCTAssertEqual(self.networkClientSpy.performRequestCount, 1)
        }
    }
    
    func test_fetchHomeData_givenInvalidData_shouldReturnNil(){
        networkClientSpy.completionData = parseFailData
        
        sut.fetchHomeData({
            XCTAssertNil($0)
            XCTAssertEqual(self.networkClientSpy.performRequestCount, 1)
        })
    }
    
    func test_transferAmount_wasCalled(){
        sut.transferAmount { _ in  }
        
        XCTAssertTrue(networkClientSpy.performRequestCalled)
    }
    
    func test_transferAmount_wasCalledOnlyOnce(){
        sut.transferAmount { _ in  }
    }
}

private extension FinanceServiceTests {

    var correctData: Data? {
        """
        {
          "name": "Mall",
          "category": "Shopping",
          "price": 100.0,
          "time": "8:57 AM"
        }
        """.data(using: .utf8)
    }

    var parseFailData: Data? {
        """
        """.data(using: .utf8)
    }
    
    var correctContactListData: Data? {
    """
        [
         {
          "name": "Fulano",
          "phone": "55 027 939399999"
          }
         ]
     """.data(using: .utf8)
    }
    
    var invalidContactListData: Data? {
    """
    """.data(using: .utf8)
    }
   
    var correctHomeDataData: Data?  {
        """
        {
          "balance": 100.0,
          "savings": 0.0,
          "spending": -300.0,
          "activity": [
            {"name": "ifood", "price": -200.0, "time": "10:00 PM"}
          ]
        }
        """.data(using: .utf8)
    }

    func makeDefaultTests() {
        let expectedURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json"

        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
        XCTAssertEqual(networkClientSpy.url?.description, expectedURL)
    }
}
