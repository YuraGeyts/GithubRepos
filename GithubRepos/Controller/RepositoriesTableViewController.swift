//
//  RepositoriesTableViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class RepositoriesTableViewController: UITableViewController {
    
    var repositories: Repositories?
    var selectedRepository: Item!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let repositoriesCount = repositories?.items.count else { return 0 }
        
        return repositoriesCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryTableViewCell
        
        guard let currentRepository = repositories?.items[indexPath.row] else { return cell }
        
        cell.configure(with: currentRepository)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRepository = repositories?.items[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? DetailViewController else { return }
        destinationViewController.repository = selectedRepository
    }
}
