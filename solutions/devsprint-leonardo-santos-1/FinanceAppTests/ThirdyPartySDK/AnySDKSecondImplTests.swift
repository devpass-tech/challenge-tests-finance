//
//  AnySDKSecondImplTests.swift
//  FinanceAppTests
//
//  Created by Gabriela Sillis on 29/06/22.
//

import XCTest
@testable import FinanceApp

final class AnySDKSecondImplTests: XCTestCase {
    private let anySDKSpy = AnySdkSpy.self
    private var isEnabled = false
    private lazy var sut = AnySDKSecondImpl(isEnabled: isEnabled, anySdk: anySDKSpy)
    
    override func tearDown() async throws {
        anySDKSpy.tearDown()
    }
    
    func test_initSDK_shouldNotCallInitSdk_whenIsEnabledIsFalse() {
        isEnabled = false
        sut.initSdk()
        XCTAssertEqual(anySDKSpy.initSdkCount, 0)
        XCTAssertFalse(anySDKSpy.initSdkWasCalled)
    }
    
    func test_initSDK_shouldCallInitSdk() {
        isEnabled = true
        sut.initSdk()
        XCTAssertEqual(anySDKSpy.initSdkCount, 1)
        XCTAssertTrue(anySDKSpy.initSdkWasCalled)
    }
    
    func test_initSDK_shouldNotCallTrackEvent_whenIsEnabledIsFalse() {
        isEnabled = false
        sut.trackEvent("any_event")
        XCTAssertEqual(anySDKSpy.trackEventCount, 0)
        XCTAssertFalse(anySDKSpy.trackEventWasCalled)
    }
    
    func test_initSDK_shouldCallTrackEvent() {
        isEnabled = true
        sut.trackEvent("any_event")
        XCTAssertEqual(anySDKSpy.trackEventCount, 1)
        XCTAssertTrue(anySDKSpy.trackEventWasCalled)
    }
    
    func test_initSDK_shouldCallTrackEvent_WithCorrectEventName() {
        isEnabled = true
        sut.trackEvent("any_event")
        XCTAssertEqual(anySDKSpy.eventName, "any_event")
    }
}
