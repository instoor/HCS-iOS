//
//  ChatAudioRecordCell.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 11/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import UIKit

class ChatAudioRecordCell: UICollectionViewCell {
    @IBOutlet weak var recordingLabel: UILabel?
    @IBOutlet weak var senderImageView: UIImageView?
    @IBOutlet weak var playPauseButton: UIButton?
    @IBOutlet weak var senderName: UILabel?
    @IBOutlet weak var messageSentTime: UILabel?
    
    var delegate: ChatAudioRecordProtocol?
    var isAudioPlaying: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
         isAudioPlaying = !isAudioPlaying
        if isAudioPlaying {
            playPauseButton?.setImage(UIImage(named: "pause"), for: .normal)
        } else {
            playPauseButton?.setImage(UIImage(named: "play"), for: .normal)
        }
        self.delegate?.playPauseAudio(isPlayAudio: isAudioPlaying, completion: { isAudioDidFinished in
            self.playPauseButton?.setImage(UIImage(named: "play"), for: .normal)
        })
    }
    public func configure(senderName: String, senderDate: Date, messageText: String, isAudioRecorded: Bool) {
        
        senderImageView?.image = UIImage(named: "bubble_sent")?.resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        if isAudioRecorded {
            playPauseButton?.isEnabled = true
        } else {
             playPauseButton?.isEnabled = true
        }
        recordingLabel?.text = messageText
        self.senderName?.text = senderName
       // messageSentTime?.isHidden = true
        //todo: messageTime?.text = "04:00"
        //do we need to pass the player when voice call comes ?
    }
}
