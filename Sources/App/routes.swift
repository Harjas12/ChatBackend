import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let messageController = MessageController()
    router.get("messages", Int.parameter, use: messageController.messages)
    router.post("messages", use: messageController.sendMessage)
    
}
