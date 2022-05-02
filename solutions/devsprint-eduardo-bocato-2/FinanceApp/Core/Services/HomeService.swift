import Foundation

final class HomeService {
    class func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!

        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let homeData = try decoder.decode(HomeData.self, from: data)
                completion(homeData)
            } catch {
                completion(nil)
            }
        }
    }
}
