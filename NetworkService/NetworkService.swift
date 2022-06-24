//
//  NetworkService.swift
//  Basic project
//
//  Created by SIMONOV on 20.06.2022.
//

import Foundation
import UIKit

   final class NetworkService {
    
    
    func fetchPhotos(query: String, completion: @escaping () -> Void) {
    let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=4FkCYf8xTUfdzd25RxI3tJd986VAPZbAOQ6yWfx0u7w"
    
    guard let url = URL(string: urlString) else {
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let jsonResult = try JSONDecoder().decode(CollectionModel.APIRespocse.self, from: data)
            DispatchQueue.main.async {
                CollectionModel.results = jsonResult.results
                completion()
            }
            
        }
        catch {
            print("Got data!")
        }
    }
    task.resume()
    }
}
