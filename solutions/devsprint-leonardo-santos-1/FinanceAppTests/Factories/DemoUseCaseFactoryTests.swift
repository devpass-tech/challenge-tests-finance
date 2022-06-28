//
//  DemoUseCaseFactoryTests.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-28.
//

import XCTest

@testable import FinanceApp

final class DemoUseCaseFactoryTests: XCTestCase {
    
    private let sut = DemoUseCaseFactory()
    
    func test_whenCallMake_mustReturnDemoUseCaseWithNotNilDependencies() {
        let mirrored = Mirror(reflecting: sut.make())
        let dependencyA = mirrored.reflect(type: DemoUseCaseDependencyA.self, label: "dependencyA")
        let dependencyB = mirrored.reflect(type: DemoUseCaseDependencyB.self, label: "dependencyB")
        XCTAssertNotNil(dependencyA)
        XCTAssertNotNil(dependencyB)
    }
    
}
