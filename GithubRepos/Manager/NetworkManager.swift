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
    
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let repositories = self.parseJSON(withData: data) {
                    self.onCompletion?(repositories)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Repositories? {
        let decoder = JSONDecoder()
        do {
            let responseRepositoriesData = try decoder.decode(Repositories.self, from: data)
            return responseRepositoriesData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
