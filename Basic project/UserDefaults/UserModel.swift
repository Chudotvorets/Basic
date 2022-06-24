

//
//  UserSettings.swift
//  Basic project
//
//  Created by SIMONOV on 14.06.2022.
//

import Foundation
import UIKit

enum GenderType: String {
    case male
    case female
}

class UserModel: NSObject, NSCoding {
   
    let name: String
    let password: String
    let email: String
    let city: String
    let gender: GenderType
    
    init(name: String, password: String, email: String, city: String, gender: GenderType) {
        self.name = name
        self.password = password
        self.email = email
        self.city = city
        self.gender = gender
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(password, forKey: "password")
        coder.encode(email, forKey: "email")
        coder.encode(city, forKey: "city")
        coder.encode(gender.rawValue, forKey: "gender")
       }
       
       required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        password = coder.decodeObject(forKey: "password") as? String ?? ""
        city = coder.decodeObject(forKey: "city") as? String ?? ""
           email = coder.decodeObject(forKey: "email") as? String ?? ""
           gender = GenderType(rawValue: (coder.decodeObject(forKey: "gender")) as? String ?? "") ?? GenderType.male
       }
}
