//
//  MessageController.swift
//  App
//
//  Created by Harjas Monga on 10/19/18.
//

import Vapor

final class MessageController {
    
    func messages(_ req: Request) throws -> Future<[Message]> {
        let id = try req.parameters.next(Int.self)
        let relevantMessages = Message.query(on: req).filter(\Message.id, .greaterThan, id).all()
        return relevantMessages
    }
    
    func sendMessage(_ req: Request) throws -> Future<Message> {
        return try req.content.decode(Message.self).flatMap({ (message) -> EventLoopFuture<Message> in
            message.sentTime = Date()
            return message.save(on: req)
        })
    }

}
