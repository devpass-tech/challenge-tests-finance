//
//  Mirror+Extension.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-28.
//

import Foundation

extension Mirror {
    func reflect<T>(type: T.Type = T.self, label: String) -> T? {
        children.compactMap {
            guard let value = $0.value as? T else { return nil }
            return $0.label == label ? value : nil
        }.first
    }
}
