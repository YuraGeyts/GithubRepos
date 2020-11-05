//
//  DetailViewController.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    var repository: Item?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var urlTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let repository = repository else { return }
        
        nameLabel.text = repository.name
        starLabel.text = String(describing: repository.starCount)
        urlTextView.text = repository.htmlURL
    }

}
