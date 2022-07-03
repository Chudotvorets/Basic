//
//  SQLiteDatabase.swift
//  Basic project
//
//  Created by SIMONOV on 01.07.2022.
//

import Foundation
import SQLite

class SQLiteDatabase {
    
    static let general = SQLiteDatabase()
    var database: Connection?
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("contactList").appendingPathExtension("sqlite3")
            database = try Connection(fileUrl.path)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func createTable() {
        SQLiteCommands.createTable()
    }
}

