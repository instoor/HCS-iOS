//
//  ContactDatabaseHelper.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 20/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import SQLite3

let dataBaseName = (dataPath as NSString).appendingPathComponent("contacts.db")

class ContactDatabaseHelper {
    let dbController = DatabaseController()
    static let sharedManager = ContactDatabaseHelper()
    
    func onCreate() {
        dbController.createDirectory()
        guard sqlite3_open(dataBaseName, &db) != SQLITE_OK else {
            print("error opening database")
            return
        }
        
        let contactTable =    "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.CONTACTS) \(DatabaseConstants.createDataTable)" +
            "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.GROUPS) \(DatabaseConstants.createGroupTable)" +
            "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.ADHOCGROUPS) \(DatabaseConstants.createContactRelationTable)" +
            "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.CONTACT_RELATION) \(DatabaseConstants.createDataTable)" +
        "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.DATA) \(DatabaseConstants.createGKTPTable)"
        
        dbController.execute(query: contactTable)
    }
}
