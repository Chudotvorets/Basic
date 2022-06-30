//
//  NetworkService.swift
//  Basic project
//
//  Created by SIMONOV on 20.06.2022.
//

import Foundation
import UIKit
import Alamofire

   final class NetworkService {
    
    
    func fetchPhotos(_ completion: @escaping ([Result]) -> Void) {
    
        AF.request("https://api.unsplash.com/search/photos?page=1&per_page=20&query=perfectionism&client_id=\(Data.clientID)", method: .get).response { data in
            switch data.result {
            case .success(let data):
                if let data = data {
                    if let result = try? JSONDecoder().decode(PhotoModel.self, from: data) {
                        print(result.results)
                        completion(result.results)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

func getTocken(code: String, completion: @escaping (Token) -> Void) {
    
    let parameters: [String: Any] = [
        "client_id": Data.clientID,
        "client_secret": Data.clientSecret,
        "redirect_uri": Data.redirectURL,
        "code": "\(code)",
        "grant_type": Data.authorizationCode
    ]
    
    AF.request("https://unsplash.com/oauth/token", method: .post, parameters: parameters).response { data in
        switch data.result {
        case .success(let data):
            if let data = data {
                if let result = try? JSONDecoder().decode(Token.self, from: data) {
                    completion(result)
                }
            }
        case .failure(let error):
            print(error.localizedDescription)
                }
            }
        }
    }
   
