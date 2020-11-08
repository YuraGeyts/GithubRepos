//
//  DetailViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    var repository: Item?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let repository = repository else { return }
        
        nameLabel.text = repository.name
        starLabel.text = String(describing: repository.starCount)
        ownerNameLabel.text = repository.owner.name
        if repository.description != nil {
            descriptionTextView.text = repository.description
        } else {
            descriptionTextView.text = "Repository don`t have description"
        }
    }
    
    @IBAction func openURL(_ sender: Any) {
        guard let url = URL(string: repository!.htmlURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
