//
//  TokenModel.swift
//  Basic project
//
//  Created by SIMONOV on 29.06.2022.
//

import Foundation

struct Token: Decodable {
    let access_token: String
    let token_type: String
}
