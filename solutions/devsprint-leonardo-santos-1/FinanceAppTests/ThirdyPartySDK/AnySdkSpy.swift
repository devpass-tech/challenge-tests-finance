//
//  AnySdkSpy.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 30/06/22.
//

import Foundation
@testable import FinanceApp

final class AnySdkSpy: AnySdkProtocol {
    private(set) static var initSdkCallCount: Int = 0
    private(set) static var trackEventCallCount: Int = 0
    private(set) static var eventNamePassed: String?
    
    static func initSdk() {
        initSdkCallCount += 1
    }
    
    static func trackEvent(_ eventName: String) {
        eventNamePassed = eventName
        trackEventCallCount += 1
    }
    
    static func resetCount() {
        initSdkCallCount = 0
        trackEventCallCount = 0
        eventNamePassed = ""
    }
}
