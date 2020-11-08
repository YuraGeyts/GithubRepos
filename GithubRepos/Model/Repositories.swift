//
//  Repositories.swift
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
    var htmlURL: String
    var description: String?
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case starCount = "stargazers_count"
        case htmlURL = "html_url"
        case description = "description"
        case owner = "owner"
    }
}

struct Owner: Codable {
    var name: String

    enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
