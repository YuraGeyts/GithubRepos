//
//  RepositoryTableViewCell.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var cellNumber: UILabel!
    
    
    func configure(with item: Item, cellIndex: Int) {
        nameLabel.text = item.name
        starLabel.text = String(describing: item.starCount)
        cellNumber.text = String(cellIndex)
    }
}
