//
//  RepositoryListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 09/05/22.
//

import UIKit

class RepositoryListViewController: UIViewController {

    let gitHubApi = GitHubAPI()

    let tableView = UITableView()
    var repos: [Repository] = []

    override func viewDidAppear(_ animated: Bool) {

        gitHubApi.fetchRepos(completion: { repos in

            if let repos = repos {

                self.repos = repos
                self.tableView.reloadData()
            }
        })

    }
}

extension RepositoryListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return repos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = UITableViewCell()
        let repo = repos[indexPath.row]

        cell.textLabel?.text = repo.name
        return cell
    }

}


