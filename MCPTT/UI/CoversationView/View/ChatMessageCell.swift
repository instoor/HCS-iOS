//
//  ChatMessageCell.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 04/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageCell: UICollectionViewCell {
    @IBOutlet weak var messageSender: UILabel?
    @IBOutlet weak var messageDate: UILabel?
    @IBOutlet weak var messageTime: UILabel?
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var messageDateHeightConst: NSLayoutConstraint!
  //  @IBOutlet weak var rightSideTimeWidthConst: NSLayoutConstraint!
    @IBOutlet weak var commentImageHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var profileView: UIImageView!
  //  @IBOutlet weak var LeftSideTimeWidthConst: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(senderName: String, senderDate: Date, messageText: String) {
        
        //Updating the cell based on the sender and receiver
        if senderName.elementsEqual(ConversationViewModel.shared.currentSender.displayName) {
            updateSenderView()
        } else {
            updateRecieveView()
        }
        //bind the model to cell
        messageSender?.text = senderName
        messageDate?.text   = "dec 25 2018"
        messageTime?.text   = "04:00"
        textView?.text      = messageText
        textView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        commentImageHeightConst.constant = textView.layer.bounds.height
        self.commentImageView.addSubview(textView)
    }
    
    func updateSenderView() {
        commentImageView.image = UIImage(named: "bubble_sent")?.resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        messageSender?.textAlignment     = .right
        textView.textAlignment           = .right
        profileView.isHidden             = true
        commentImageView.tintColor       = UIColor.black
    }
    
    func updateRecieveView() {
        commentImageView.image = UIImage(named: "bubble_received")?.resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        messageSender?.textAlignment     = .left
        textView.textAlignment           = .left
        profileView.isHidden             = false
    }
    
}
