//
//  Message.swift
//  App
//
//  Created by Harjas Monga on 10/19/18.
//

import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Message: SQLiteModel {
    
    var id: Int?
    
    var author: String
    var message: String
    var sentTime: Date?

}

/// Allows `Message` to be used as a dynamic migration.
extension Message: Migration { }

/// Allows `Message` to be encoded to and decoded from HTTP messages.
extension Message: Content { }

/// Allows `Message` to be used as a dynamic parameter in route definitions.
extension Message: Parameter { }
