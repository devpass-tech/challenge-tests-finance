import Foundation

protocol FinanceServiceProtocol {

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void)
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void)
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void)
}

final class FinanceService: FinanceServiceProtocol {
    typealias URLMaker = (_ urlString: String) -> URL?
    
    let networkClient: NetworkClientProtocol
    let urlMaker: URLMaker

    init(networkClient: NetworkClientProtocol, urlMaker: @escaping URLMaker = URL.init(string:)) {
        self.networkClient = networkClient
        self.urlMaker = urlMaker
    }

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        fetch(urlstring: "home_endpoint.json") { model in
            completion(model)
        }
    }

    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        fetch(urlstring: "activity_details_endpoint.json") { model in
            completion(model)
        }
    }

    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {
        fetch(urlstring: "contact_list_endpoint.json") { model in
            completion(model)
        }
    }

    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
        fetch(urlstring: "transfer_successful_endpoint.json") { model in
            completion(model)
        }
    }

    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!

        networkClient.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userProfile = try decoder.decode(UserProfile.self, from: data)
                completion(userProfile)
            } catch {
                completion(nil)
            }
        }
    }
    
    private func fetch<T: Decodable>(
        urlstring: String,
        decoder: JSONDecoder = .init(keyDecodingStrategy: .convertFromSnakeCase),
        _ completion: @escaping (T?) -> Void
    ) {
       
        let base = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/"
        guard let url = urlMaker("\(base)\(urlstring)") else {
            completion(nil)
            return
        }
        
        networkClient.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoded = try decoder.decode(T.self, from: data)
                completion(decoded)
            } catch {
                completion(nil)
            }
        }
    }
}

private extension JSONDecoder {
    convenience init(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
