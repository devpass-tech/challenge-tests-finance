import Foundation

extension String {
    func removingSpaces() -> String {
        return replacingOccurrences(of: " ", with: "")
    }
}
