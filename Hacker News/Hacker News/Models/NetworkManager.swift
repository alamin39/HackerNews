//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Al-Amin on 18/8/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                }
                catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
