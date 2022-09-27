struct Activity: Decodable, Equatable {
    let name: String
    let price: Float
    let time: String
}

extension Activity {
    func formattedInfo() -> String {
        "$\(price) • \(time)"
    }
}
