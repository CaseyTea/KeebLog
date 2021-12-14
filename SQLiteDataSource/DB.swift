//
//  DB.swift
//  KeebLog
//
//  Created by Casey Thatsanaphonh on 12/3/21.
//

import Foundation
import SQLite

/*
 TODO: Fix issue - View not updating when adding new data to Database 
 */

class Database {
    var conn : Connection!
    var tbl : Table!
    
    // Columns for the database
    var keebName : Expression<String>!
    var keebCost : Expression<Int>!
    //var keebPhoto : Expression<Data>!
    var keebSwitch : Expression<String>!
    var id : Expression<String>!
    
    init() {
        let rootPath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbPath = rootPath.appendingPathComponent("keebdb.sqlite").path
        print("Database location: \(dbPath)")
        conn = try! Connection(dbPath)
        //
        initialize()
    }
    
    private func initialize() {
        tbl = Table("keyboard")
        id = Expression<String>("ID")
        keebName = Expression<String>("keyboard_name")
        keebCost = Expression<Int>("keyboard_cost")
        //keebPhoto = Expression<Data>("photo")
        keebSwitch = Expression<String>("switch")
        // Create table if not exist
        let crTbl = tbl.create(ifNotExists: true){t in
            t.column(id)
            t.column(keebName)
            t.column(keebCost)
            //t.column(keebPhoto)
            t.column(keebSwitch)
        }
        try! conn.run(crTbl)
    }
}

class KeyboardRepo : ObservableObject {
    
    var db = Database()
    
    //@Published var kList : [Keyboard] = []
    
    static private var repository : KeyboardRepo!
    
    static func get()-> KeyboardRepo {
        if repository == nil {
            repository = KeyboardRepo()
        }
        return repository
    }
    
    // This function adds the keyboard detail to the data base 
    func createKeyboard(keebObj : Keyboard){
        
        let conn = db.conn!
        let tbl = db.tbl!
        // Not going to create the col for photo need more information on how to save from gallery
        let initTbl = tbl.insert(db.id <- keebObj.id,
                                 db.keebName <- keebObj.nameOfKeeb,
                                 db.keebCost <- keebObj.costOfKeeb,
                                 db.keebSwitch <- keebObj.keebSwitch)
        try! conn.run(initTbl)
    }
    
    func getKeyboard() -> [Keyboard] {
        var list = [Keyboard]()
        let table = db.tbl!
        let results = try! db.conn.prepare(table)
        for record in results {
            try! list.append(Keyboard(name: record.get(db.keebName), cost: record.get(db.keebCost), switchName: record.get(db.keebSwitch)))
        }
        //kList = list
        return list
    }
}


