//
//  MainViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var repositoryNameTextField: UITextField?
    
    @IBAction func searchAction(_ sender: Any) {
        guard let reposName = repositoryNameTextField?.text else { return }
        let urlString = "https://api.github.com/search/repositories?q=\(reposName)+language:swift&sort=stars&order=desc"
        let urlStringPage1 = "\(urlString)&per_page=15&page=1"
        let urlStringPage2 = "\(urlString)&per_page=15&page=2"
        
        let firstQueue = DispatchQueue(label: "firstQueue", qos: .utility)
        let secondQueue = DispatchQueue(label: "secondQueue", qos: .utility)

        firstQueue.async {
            NetworkManager.shared.dataFetcher(urlString: urlStringPage1)
        }
        secondQueue.asyncAfter(deadline: .now() + 1) {
            NetworkManager.shared.dataFetcher(urlString: urlStringPage2)
        }
        performSegue(withIdentifier: "showRepositoriesSegue", sender: nil)
    }
}
