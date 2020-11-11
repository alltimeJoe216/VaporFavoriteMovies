//
//  File.swift
//  
//
//  Created by Joseph Veverka on 11/11/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovie: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        // Create a table called "Movies"
        database.schema("movies")// table name
            .id()
            .field("title", .string) // column name
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies").delete() // drop the table

    }
    
    
}
