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
    
    
    func getData(_ completion: @escaping ([ReceivedData]) -> Void) {
    
        AF.request("https://api.unsplash.com/search/photos?page=1&per_page=30&query=apple&client_id=\(UserData.clientID)", method: .get).response { data in
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
    
    let options: [String: Any] = [
        "client_id": UserData.clientID,
        "client_secret": UserData.clientSecret,
        "redirect_uri": UserData.redirectURL,
        "code": "\(code)",
        "grant_type": UserData.authorizationCode
    ]
    
    AF.request("https://unsplash.com/oauth/token", method: .post, parameters: options).response { data in
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
   
