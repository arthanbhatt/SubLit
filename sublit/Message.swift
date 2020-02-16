//
//  Message.swift
//  sublit
//
//  Created by Vivek Cherian on 2/16/20.
//  Copyright © 2020 Vivek Cherian. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

struct Member {
    let name: String
    let color: UIColor
    let senderId : String
    let displayName : String
}

struct Message {
    let member: Member
    let text: String
    let messageId: String
}


extension Message: MessageType {
    
    var senderId: String {
        return member.name
    }
    
    var displayName: String {
        return member.name
    }
    
//    var sender: SenderType {
//        return SenderType.type as! SenderType
//    }
//
    var sender: SenderType {
        return member as! SenderType
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
