//
//  ThirdyPartySDKTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 30/06/22.
//

import XCTest
@testable import FinanceApp

final class ThirdyPartySDKTests: XCTestCase {
    private let sdkSpy = AnySdkSpy()
    private let isEnabled = false
    private lazy var sut = AnySDKFirstImpl(isEnabled: isEnabled, sdk: sdkSpy)
    
    override func setUp() {
        type(of: sdkSpy).resetCount()
    }
    
    func test_whenIsEnabled_shouldInitSDK() {
        
    }
    
}
