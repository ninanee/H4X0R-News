//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Yun Ni on 2024-05-23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var post = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.post = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
}
