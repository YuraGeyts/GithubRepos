//
//  NetworkManager.swift
//
//  Created by Yura Geyts on 05.11.2020.
//

import Foundation

class NetworkManager {
    private init(){}
    static let shared = NetworkManager()
    
    var onCompletion: ((Repositories) -> ())?
    
    func dataFetcher(urlString: String) {
        request(with: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(Repositories.self, from: data)
            if let repositories = response {
                self.onCompletion?(repositories)
            }
        }
    }
    
    private func request(with urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }.resume()
    }
}
