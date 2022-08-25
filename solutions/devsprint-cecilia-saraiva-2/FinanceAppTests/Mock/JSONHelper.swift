//
//  JSONHelper.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//
import Foundation

struct JSONHelper {
    func loadJsonFrom<T: Codable>(fileName: String, type: T.Type) -> T? {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")!
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }
        if let objDecoded = try? JSONDecoder().decode(T.self, from: jsonData) {
            return objDecoded
        }
        return nil
    }

    func loadDataFrom(fileName: String) -> Data? {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
            return data
        }
        return nil
    }
}
