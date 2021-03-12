//
//  RealmConfiguration.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import RealmSwift

class RealmConfiguration {
    
    var database: Realm?
    
    init() {
        try? database = Realm()
    }
}
