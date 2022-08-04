//
//  GitHubAPI.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 09/05/22.
//

import Foundation

struct Repository: Decodable {

    let id: Int
    let name: String
    let fork: Bool
    let stargazers_count: Int
}

struct GitHubAPI {

    func fetchRepos(completion: @escaping ([Repository]?) -> Void) {

        // 2 - Definir a URL de request
        let url = URL(string: "https://api.github.com/users/devpass-tech/repos")!

        // 3 - Definir uma dataTask passando a url e um clojure como parâmetros
        let dataTask = URLSession.shared.dataTask(with: url,
                                                  completionHandler: { data, response, error in

            // 4 - Tratar dados retornados pela API (parse de JSON)
            if let data = data {

                let jsonDecoder = JSONDecoder()
                let repos = try? jsonDecoder.decode([Repository].self, from: data)
                completion(repos)
            } else {

                completion(nil)
            }
        })

        // 5 - Fazer a chamada de fato
        dataTask.resume()
    }

    func fetchStars() {

    }
}
