//
//  MainViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var repositoryNameTextField: UITextField?
    
    var selectedLanguage = ""
    var previousButton = UIButton()
    
    @IBAction func searchAction(_ sender: Any) {
        guard let reposName = repositoryNameTextField?.text else { return }
        let urlString = generateURLwith(repositoryName: reposName, language: selectedLanguage)
        
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
    
    
    @IBAction func selectedLanguage(_ sender: UIButton) {
        
        guard let selectedTitle = sender.currentTitle else { return }
        
        if previousButton != sender {
            previousButton.isHighlighted = true
            previousButton = sender
            selectedLanguage = selectedTitle
        } else {
            if selectedLanguage == selectedTitle {
                selectedLanguage = ""
            } else {
                selectedLanguage = selectedTitle
            }
        }
    }
    
    private func generateURLwith(repositoryName: String, language: String) -> String {
        return "https://api.github.com/search/repositories?q=\(repositoryName)+language:\(language)&sort=stars&order=desc"
    }
}
