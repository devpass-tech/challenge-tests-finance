//
//  ThirdyPartySDKTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 30/06/22.
//

import XCTest
@testable import FinanceApp

final class ThirdyPartySDKTestsFirstImp: XCTestCase {
    private let sdkSpy = AnySdkSpyFirstImp()
    private var isEnabled = false
    private lazy var sut = AnySDKFirstImpl(isEnabled: isEnabled, sdk: sdkSpy)
    
    override func setUp() {
        type(of: sdkSpy).resetCount()
    }
    
    func test_initSdk_whenEnabled_shouldCallInitSDK() {
        isEnabled = true
        sut.initSDK()
        XCTAssertEqual((type(of: sdkSpy).initSdkCallCount), 1)
    }
    
    func test_initSdk_whenIsNotEnabled_shouldNotCallInitSDK() {
        isEnabled = false
        sut.initSDK()
        XCTAssertEqual((type(of: sdkSpy).initSdkCallCount), 0)
    }
    
    func test_trackEvent_whenIsEnabled_shouldTrackEventPassedOnParameter() {
        isEnabled = true
        type(of: sdkSpy).trackEvent("shouldTrackThis")
        
        XCTAssertEqual((type(of: sdkSpy).trackEventCallCount), 1)
        XCTAssertEqual((type(of: sdkSpy).eventNamePassed), "shouldTrackThis")
    }
    
    func test_trackEvent_whenIsNotEnabled_shouldNotCallTrackEvents() {
        isEnabled = false
        type(of: sdkSpy).trackEvent("shouldNotTrackThis")
        
        XCTAssertEqual((type(of: sdkSpy).trackEventCallCount), 1)
    }
}
