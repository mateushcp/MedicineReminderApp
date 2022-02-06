//
//  DBHelper.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 05/02/22.
//

import Foundation
import SQLite3

class DBHelper {
    init()
    {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS prescription(Id INTEGER PRIMARY KEY ,name TEXT ,timeToTime TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("prescription table created.")
            } else {
                print("prescription table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(id: Int, name: String, timeToTime: String) {
        let prescriptions = read()
        for p in prescriptions
        {
            if p.id == id
            {
                return
            }
        }
        let insertStatementString = "INSERT INTO prescription (Id, name, timeToTime) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (timeToTime as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func read() -> [Prescription] {
          let queryStatementString = "SELECT * FROM prescription;"
          var queryStatement: OpaquePointer? = nil
          var psns : [Prescription] = []
          if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
              while sqlite3_step(queryStatement) == SQLITE_ROW {
                  let id = sqlite3_column_int(queryStatement, 0)
                  let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                  let timeToTime = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                  psns.append(Prescription(name: name, timeToTime: timeToTime, id: Int(id)))
                  print("Query Result:")
                  print("\(id) | \(name) | \(timeToTime)")
              }
          } else {
              print("SELECT statement could not be prepared")
          }
          sqlite3_finalize(queryStatement)
          return psns
      }
      
      func deleteByID(id:Int) {
          let deleteStatementStirng = "DELETE FROM person WHERE Id = ?;"
          var deleteStatement: OpaquePointer? = nil
          if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
              sqlite3_bind_int(deleteStatement, 1, Int32(id))
              if sqlite3_step(deleteStatement) == SQLITE_DONE {
                  print("Successfully deleted row.")
              } else {
                  print("Could not delete row.")
              }
          } else {
              print("DELETE statement could not be prepared")
          }
          sqlite3_finalize(deleteStatement)
      }
      
  }

