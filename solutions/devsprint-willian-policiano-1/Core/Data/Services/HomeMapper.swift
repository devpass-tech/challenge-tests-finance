import Foundation

struct HomeMapper {
    private typealias Error = HomeService.Error

    private struct HomeResponse: Decodable {
        var balance_price: String?
        var svgs: Decimal?
        var spending: Decimal?

        func toDomain() -> Home?  {
            guard let savings = svgs,
                  let spending = spending,
                  let balanceString = balance_price,
                  let balance = Double(balanceString) else { return nil }

            return Home(
                balance: Decimal(balance),
                savings: savings,
                spending: spending)
        }
    }

    static func map(response: (code: Int, data: Data)) -> HomeService.Result {
        let httpOK = 200

        guard response.code == httpOK else {
            return .failure(Error.notOk)
        }

        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode(HomeResponse.self, from: response.data)
            guard let home = response.toDomain() else {
                return .failure(Error.invalidData)
            }

            return .success(home)
        } catch {
            return .failure(Error.invalidData)
        }
    }
}
