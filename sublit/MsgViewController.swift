//
//  MsgViewController.swift
//  sublit
//
//  Created by Vivek Cherian on 2/16/20.
//  Copyright © 2020 Vivek Cherian. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView
//import MessageInputBar

class MsgViewController: MessagesViewController, InputBarAccessoryViewDelegate, MessagesDisplayDelegate, MessagesLayoutDelegate, MessageCellDelegate {

    var messages: [Message] = []
    var member: Member!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        member = Member(name: "bluemoon", color: .blue)
//        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messagesLayoutDelegate = self
//        messageInputBar.delegate = self
//        messagesCollectionView.messagesDisplayDelegate = self
        
        messageInputBar.delegate = self
        maintainPositionOnKeyboardFrameChanged = true
        messageInputBar.inputTextView.tintColor = .yellow
        messageInputBar.sendButton.setTitleColor(.purple, for: .normal)
        
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messageCellDelegate = self
        
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        
        
    }
    
    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 0
    }
    
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {
        
        let message = messages[indexPath.section]
        let color = message.member.color
        avatarView.backgroundColor = color
    }
    
    func messageInputBar(
        _ inputBar: InputBarAccessoryView,
        didPressSendButtonWith text: String) {
        
        let newMessage = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)
        
        messages.append(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MsgViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return SenderType.self as! SenderType
    }
    
    func numberOfSections(
        in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
        return messages[indexPath.section]
    }
    
    func messageTopLabelHeight(
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 12
    }
    
    func messageTopLabelAttributedText(
        for message: MessageType,
        at indexPath: IndexPath) -> NSAttributedString? {
        
        return NSAttributedString(
            string: message.sender.displayName,
            attributes: [.font: UIFont.systemFont(ofSize: 12)])
    }
}

//extension MsgViewController: MessagesLayoutDelegate {
//    func heightForLocation(message: MessageType,
//                           at indexPath: IndexPath,
//                           with maxWidth: CGFloat,
//                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
//
//        return 0
//    }
//}
//
//extension MsgViewController: MessagesDisplayDelegate {
//    func configureAvatarView(
//        _ avatarView: AvatarView,
//        for message: MessageType,
//        at indexPath: IndexPath,
//        in messagesCollectionView: MessagesCollectionView) {
//
//        let message = messages[indexPath.section]
//        let color = message.member.color
//        avatarView.backgroundColor = color
//    }
//}
//
//extension MsgViewController: MessageInputBarDelegate {
//    func messageInputBar(
//        _ inputBar: MessageInputBar,
//        didPressSendButtonWith text: String) {
//
//        let newMessage = Message(
//            member: member,
//            text: text,
//            messageId: UUID().uuidString)
//
//        messages.append(newMessage)
//        inputBar.inputTextView.text = ""
//        messagesCollectionView.reloadData()
//        messagesCollectionView.scrollToBottom(animated: true)
//    }
//}


