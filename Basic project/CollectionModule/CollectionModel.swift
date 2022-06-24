//
//  CollectionModel.swift
//  Basic project
//
//  Created by SIMONOV on 21.06.2022.
//

import Foundation

struct CollectionModel {
    
       static var results: [Result] = []

        struct APIRespocse: Codable {
            let total: Int
            let total_pages: Int
            let results: [Result]
        }
        struct Result: Codable {
            let id: String
            let urls: URLS
        }

        struct URLS: Codable {
            let regular: String
        }
}
