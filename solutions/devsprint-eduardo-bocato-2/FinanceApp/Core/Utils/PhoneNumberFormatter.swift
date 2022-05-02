import Foundation

enum PhoneNumberFormatter {
    static func format(_ phone: String) -> String {
        let digits = String(phone.filter(("0"..."9").contains))
        if digits.count == 10 {
            return digits.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1)-$2-$3", options: .regularExpression, range: nil)
        }
        else if digits.count == 11 {
            return digits.replacingOccurrences(
                of: "(\\d{1})(\\d{3})(\\d{3})(\\d+)",
                with: "$1($2)-$3-$4",
                options: .regularExpression,
                range: nil
            )
        } else { return phone }
    }
}
