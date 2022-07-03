//
//  CollectionModel.swift
//  Basic project
//
//  Created by SIMONOV on 21.06.2022.
//

import Foundation

    struct PhotoModel: Decodable {
        let results: [ReceivedData]
    }

    struct ReceivedData: Decodable {
        let id: String?
        let urls: Urls?
        let user: User?
    }

    struct Urls: Decodable {
        let regular: String?
    }
    
    struct User: Decodable {
        let firstName: String?
        let lastName: String?
        
        enum CodingKeys: String, CodingKey {
            case firstName = "first_name"
            case lastName = "last_name"
        }
    }
