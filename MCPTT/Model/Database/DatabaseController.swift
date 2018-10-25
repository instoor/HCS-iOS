//
//  DatabaseController.swift
//  MCPTT
//
//  Created by Vinayak Naik on 18/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import SQLite3

let dataPath = "\(NSHomeDirectory())/MCPTT/"
var db: OpaquePointer?

class DatabaseController {
    
    init() {
    }
    
    func createDirectory() {
        if (!FileManager.default.fileExists(atPath: dataPath)) {
            try?FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
        }
    }
    
    func isOpen() -> Bool {
        let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE
        let status =  sqlite3_open_v2(dataPath, &db, flags, nil)
        if status != SQLITE_OK {
            print("error opening database")
            return false
        }
        return true
    }
    
    func execute(query: String) {
        guard let database = db  else {
            return
        }
        if sqlite3_exec(database, query, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(database))
            print("error in executing query: \(errmsg)")
        }
    }
    
    // Insert Statement
    func insert(table: String, contentValues: [[String: Any]]) -> Int {
        var id: Int = -1
        if isOpen() {
            var statement: OpaquePointer?
            //Check Multiple Columns
            var getKeys = ""
            var getValues = ""
            if contentValues.count == 1 {
                getKeys = (contentValues.first?.keys)?.joined(separator: ",") ?? ""

                if let values = (contentValues.first)?.values {
                    for (index, element) in values.enumerated() {
                        getValues.append(index == values.count-1 ? "\(element)" : "\(element),")
                    }
                }
            } else {}

            let insertQuery = "INSERT INTO \(table) (\(getKeys)) VALUES (\(getValues))"
            if  sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
                
                if sqlite3_step(statement) == SQLITE_DONE {
                    id = Int(sqlite3_last_insert_rowid(statement))
                    print("inserted")
                } else {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
            }
            sqlite3_finalize(statement)
        }
        return id
    }

    // Update Statement
    func update(table: String, updateValues: String, whereClause: String) -> Int {
        var count: Int = -1
        
        if isOpen() {
            var statement: OpaquePointer?
            let updateQuery = "UPDATE \(table) SET \(updateValues) WHERE \(whereClause)"
            
            if  sqlite3_prepare_v2(db, updateQuery, -1, &statement, nil) == SQLITE_OK {
                if sqlite3_step(statement) == SQLITE_DONE {
                    count = Int(sqlite3_column_count(statement))
                } else {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
            }
            sqlite3_finalize(statement)
        }
        return count
    }
    
    // Delete Statement
    func delete(table: String, selection: String, args: [String]) -> Int {
        var count: Int = -1
        
        if isOpen() {
            var statement: OpaquePointer?
            
            let select = selection.isEmpty ? "WHERE \(selection)" : ""
            let deleteQuery = "DELETE FROM \(table) \(select)"
            
            if  sqlite3_prepare_v2(statement, deleteQuery, -1, &statement, nil) == SQLITE_OK {
                
                if sqlite3_step(statement) == SQLITE_DONE {
                    count = Int(sqlite3_column_count(statement))
                } else {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(statement)))")
                }
            }
            sqlite3_finalize(statement)
            
        }
        return count
    }
    
    // Select Statement
    func select(table: String, columns: [String], whereClause: String, orderBy: String, sortOrder: String) -> [AnyObject] {
        var result = [AnyObject]()
        if isOpen() {
            var statement: OpaquePointer?
            var columnArgs = ""
            if columns.isEmpty {
               columnArgs = "*"
            } else {
                columnArgs = columns.joined(separator: ",")
            }
            
            let getWhereClause = whereClause.isEmpty ? "" : "WHERE \(whereClause)"
            let checkOrderBy = orderBy.isEmpty ? "" : "ORDER BY \(orderBy)"
            let checkSortOrder = sortOrder.isEmpty ? "" : sortOrder
            
            let selecttQuery = "SELECT (\(columnArgs)) FROM \(table) \(getWhereClause) \(checkOrderBy) \(checkSortOrder)"
            
            if sqlite3_prepare(db, selecttQuery, -1, &statement, nil) == SQLITE_OK {
                
                if sqlite3_step(statement) == SQLITE_DONE {
                    while sqlite3_step(statement) == SQLITE_ROW {
                        result.append(statement as AnyObject)
                    }
                } else {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
            }
            sqlite3_finalize(statement)
        }
        
        return result
        
    }
    
    func closeDatabase() {
        if sqlite3_close(db) != SQLITE_OK {
            print("error closing database")
        }
        db = nil
    }
    
    deinit {
    }
    
}
