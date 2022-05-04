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


#if DEBUG
extension HomeData {
    static func fixture(
        balance: Float = 3.0,
        savings: Float = 2.0,
        spending: Float = 1.0,
        activity: [Activity] = []
    ) -> Self {
        .init(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity
        )
    }
}
#endif
