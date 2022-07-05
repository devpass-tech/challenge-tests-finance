//
//  AnySdkSpy.swift
//  FinanceAppTests
//
//  Created by Gabriela Sillis on 30/06/22.
//

@testable import FinanceApp

final class AnySdkSpy: AnySdkProtocol {
    private(set) static var eventName: String?
    private(set) static var initSdkCount = 0
    private(set) static var initSdkWasCalled = false
    private(set) static var trackEventWasCalled = false
    private(set) static var trackEventCount = 0
    
    static func initSdk() {
        initSdkCount += 1
        initSdkWasCalled = true
    }
    
    static func trackEvent(_ eventName: String) {
        self.eventName = eventName
        trackEventCount += 1
        trackEventWasCalled = true
    }
    
    static func tearDown() {
        eventName = ""
        initSdkCount = 0
        initSdkWasCalled = false
        trackEventWasCalled = false
        trackEventCount = 0
    }
}
