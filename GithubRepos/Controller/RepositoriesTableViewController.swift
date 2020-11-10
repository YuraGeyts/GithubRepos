//
//  RepositoriesTableViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class RepositoriesTableViewController: UITableViewController {
    
    //    var repositories: Repositories?
    var repositories: [Item] = []
    var selectedRepository: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.onCompletion = { fetchedRepositories in
            DispatchQueue.main.async {
                if self.repositories.first?.starCount ?? 0 > fetchedRepositories.items.first?.starCount ?? 0 {
                    self.repositories.append(contentsOf: fetchedRepositories.items)
                    self.tableView.reloadData()
                } else {
                    self.repositories.insert(contentsOf: fetchedRepositories.items, at: 0)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        guard let repositoriesCount = repositories?.items.count else { return 0 }
        return repositories.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryTableViewCell
        
        //        guard let currentRepository = repositories?.items[indexPath.row] else { return cell }
        let currentRepository = repositories[indexPath.row]
        
        cell.configure(with: currentRepository, cellIndex: indexPath.row + 1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        selectedRepository = repositories?.items[indexPath.row]
        selectedRepository = repositories[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? DetailViewController else { return }
        destinationViewController.repository = selectedRepository
    }
}
