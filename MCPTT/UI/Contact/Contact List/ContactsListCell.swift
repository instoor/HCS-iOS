//
//  ContactsListCell.swift
//  mcpttapp
//
//  Created by Raju Maramulla on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

//enum ContactAvailability: String {
//    case online
//    case offline
//    case dnd
//}
/*
class ContactsListCell: UICollectionViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactEmailLabel: UILabel!
    @IBOutlet weak var contactAvailabiltyStatus: UIImageView!
    @IBOutlet weak var callContactButton: UIButton!
    
    @IBOutlet weak var separatorLineLabel: UILabel!
    
    @IBAction func callContact(_ sender: Any) {
        
    }
    
    func configureContactCell(contactMainCellVM: ContactsListCellViewModel) {
        
        contactNameLabel.text = contactMainCellVM.contactName
        contactEmailLabel.text = contactMainCellVM.contactEmail
        switch contactMainCellVM.contactAvailablabilityStatus {
            case ContactAvailability.online.rawValue:
                contactAvailabiltyStatus.image = UIImage(named: "blue-circele")
            case ContactAvailability.offline.rawValue:
                contactAvailabiltyStatus.image = UIImage(named: "orange-circle")
            case ContactAvailability.dnd.rawValue:
                contactAvailabiltyStatus.image = UIImage(named: "gray-circlepng")
            default:
                contactAvailabiltyStatus.image = UIImage(named: "blue-circele")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
*/
class ContactsListCell: UITableViewCell {
    
    @IBOutlet weak var contactNameLabel: UILabel?
    @IBOutlet weak var contactEmailLabel: UILabel?
    @IBOutlet weak var contactAvailabilityStatus: UIImageView?
    @IBOutlet weak var callContactButton: UIButton?
    
    @IBOutlet weak var separatorLineLabel: UILabel?
    
    @IBAction func callContact(_ sender: Any) {
        
    }
    
    func configureContactCell(contactMainCellVM: ContactsListCellViewModel) {
        
        contactNameLabel?.text = contactMainCellVM.contactName
        contactEmailLabel?.text = contactMainCellVM.contactEmail
        switch contactMainCellVM.contactAvailablabilityStatus {
        case ContactAvailability.online.rawValue:
            contactAvailabilityStatus?.image = UIImage(named: "blue-circele")
        case ContactAvailability.offline.rawValue:
            contactAvailabilityStatus?.image = UIImage(named: "orange-circle")
        case ContactAvailability.dnd.rawValue:
            contactAvailabilityStatus?.image = UIImage(named: "gray-circlepng")
        default:
            contactAvailabilityStatus?.image = UIImage(named: "blue-circele")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        contactNameLabel.text = "Raju"
//        contactEmailLabel.text = "Rajub"
        //contactAvailabiltyStatus = UIImageView()
        
        // Initialization code
    }
    
}
