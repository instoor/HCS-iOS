//
//  ContactListCell.swift
//  MCPTT
//
//  Created by Harman on 10/11/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import UIKit

enum ContactAvailability: String {
    case online
    case offline
    case dnd
}
class ContactListCell: UITableViewCell {

    @IBOutlet weak var callContactButton: UIButton!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactAvailibilityStatus: UIImageView!
    @IBOutlet weak var mcidLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureChanneListCell(contactVM: Contact) {
        
        contactNameLabel.text = contactVM.contactName
        mcidLabel.text = contactVM.contactEmail
        switch contactVM.contactAvailablabilityStatus {
        case MemberAvailability.online.rawValue:
            contactAvailibilityStatus.image = UIImage(named: "blue-circele")
        case MemberAvailability.offline.rawValue:
            contactAvailibilityStatus.image = UIImage(named: "orange-circle")
        case MemberAvailability.dnd.rawValue:
            contactAvailibilityStatus.image = UIImage(named: "gray-circlepng")
        default:
            contactAvailibilityStatus.image = UIImage(named: "blue-circele")
        }
    }
}
