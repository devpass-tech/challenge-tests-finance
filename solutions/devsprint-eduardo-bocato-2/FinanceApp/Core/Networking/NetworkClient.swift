import Foundation

final class NetworkClient {
    static let shared = NetworkClient()

    func performRequest(with url: URL, completion: @escaping (Data?) -> Void) {
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in

            if let _ = error {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            completion(data)
        }
        task.resume()
    }
}
