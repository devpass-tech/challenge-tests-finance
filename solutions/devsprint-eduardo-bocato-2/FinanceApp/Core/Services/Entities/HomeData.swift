import Foundation

struct HomeData: Decodable {
    let balance: Float
    let savings: Float
    let spending: Float
    let activity: [Activity]
}

struct Activity: Decodable {
    let name: String
    let price: Float
    let time: String
}

extension Activity {
    func formattedInfo() -> String {
        return "$\(price) • \(time)"
    }
}
