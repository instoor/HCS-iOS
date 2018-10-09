//
//  MemberListTableViewCell.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

enum MemberAvailability: String {
    case online
    case offline
    case dnd
}

class MemberListTableViewCell: UITableViewCell {

    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberEmailLabel: UILabel!
    @IBOutlet weak var memberAvailabiltyStatus: UIImageView!
    @IBOutlet weak var addMemberButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureChanneListCell(memberListCellVM: MemberListCellViewModel) {
        
        memberNameLabel.text = memberListCellVM.memberName
        memberEmailLabel.text = memberListCellVM.memberEmail
        switch memberListCellVM.memberAvailablabilityStatus {
        case MemberAvailability.online.rawValue:
            memberAvailabiltyStatus.image = UIImage(named: "blue-circele")
        case MemberAvailability.offline.rawValue:
            memberAvailabiltyStatus.image = UIImage(named: "orange-circle")
        case MemberAvailability.dnd.rawValue:
            memberAvailabiltyStatus.image = UIImage(named: "gray-circlepng")
        default:
           memberAvailabiltyStatus.image = UIImage(named: "blue-circele")
        }
        if memberListCellVM.isMemeberInConatctList {
            addMemberButton.isHidden = true
        } else {
           addMemberButton.isHidden = false
        }
    }
    
    @IBAction func addContact(_ sender: Any) {
        
    }
    
}
