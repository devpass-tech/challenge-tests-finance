//
//  Contact+Extensions.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 19/08/22.
//

import XCTest
@testable import FinanceApp

extension Contact {
    static func list(name: String = "",
                        phone: String = "") -> Self {
        Contact(name: name,
                phone: phone)
    }
}

extension Contact: Equatable {
    public static func == (lhs: Contact, rhs: Contact) -> Bool {
        return rhs.name == lhs.name
    }
    
}
