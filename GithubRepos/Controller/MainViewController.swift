//
//  MainViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var repositoryNameTextField: UITextField?
    
    var repositories: Repositories!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.onCompletion = { repositories in
            DispatchQueue.main.async {
                self.repositories = repositories
                self.performSegue(withIdentifier: "showRepositoriesSegue", sender: nil)
            }
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let reposName = repositoryNameTextField?.text else { return }
        let urlString = "https://api.github.com/search/repositories?q=\(reposName)+language:swift&sort=stars&order=desc"
        NetworkManager.shared.performRequest(with: urlString)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? RepositoriesTableViewController else { return }
        destinationViewController.repositories = repositories
    }
}
