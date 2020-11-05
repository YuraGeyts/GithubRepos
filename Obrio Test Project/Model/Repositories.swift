//
//  Repositories.swift
//  Obrio Test Project
//
//  Created by Yura Geyts on 05.11.2020.
//

import Foundation

struct Repositories: Codable {
    
    var totalCount: Int
    var incompleteResult: Bool
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResult = "incomplete_results"
        case items = "items"
    }
}

struct Item: Codable {
    
    var name: String
    var starCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case starCount = "stargazers_count"
    }
}
