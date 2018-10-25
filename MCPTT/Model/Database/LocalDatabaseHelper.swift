//
//  LocalDatabaseHelper.swift
//  MCPTT
//
//  Created by Toor, Sanju on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import SQLite3

private let  TAG = "LocalDatabaseHelper"
private let  DATABASE_NAME = "local.db"

class LocalDatabaseHelper {
    init() {
        
    }
    
    func onCreate(database: OpaquePointer?) {
        if sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS \(DatabaseConstants.createMessageDatabaseTable)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("error creating table: \(errmsg)")
        }
    }
}
