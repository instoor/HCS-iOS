//
//  ContactsViewController.swift
//  mcpttapp
//
//  Created by Raju Maramulla on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

final class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var contactNameDictionary = [String: [String]]()
    var contactNameTitles = [String]()
    var contacts = [String]()
    
    var groups = ["Special TF A(999)", "Special TF B(999)", "Special TF C(999)"]
    
     var contactSectionTitlesUpdated = [String]()
   
    @IBOutlet weak var tableView: UITableView!
    
    let screenSize = UIScreen.main.bounds
    
    lazy var viewModel: ContactsListModel = {
        return ContactsListModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init view model
        tableView.register(UINib.init(nibName: "ContactListHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ContactListHeaderView")
        initVM()
 
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
        let vm = viewModel.cellViewModels
        
        for name in vm {
            //print(names)
            contacts.append(name.contactName)
            //cars.append(names.contactEmail)
            //cars.append(names.contactAvailablabilityStatus)
        }
       
        for contact in contacts {
            let contactKey = String(contact.prefix(1))
            if var contactListArray = contactNameDictionary[contactKey] {
                contactListArray.append(contact)
                contactNameDictionary[contactKey] = contactListArray
            } else {
                contactNameDictionary[contactKey] = [contact]
            }
        }
        //print(carsDictionary)
        contactNameTitles = [String](contactNameDictionary.keys)
        //print(carSectionTitles)
        contactNameTitles = contactNameTitles.sorted(by: { $0 < $1 })
        
        contactSectionTitlesUpdated = ["Me", "Groups"]
        contactSectionTitlesUpdated += contactNameTitles
        
    }
    
    func initVM() {
        viewModel.initFetch()
        
        viewModel.reloadCollectionViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return contactSectionTitlesUpdated.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return groups.count
        default:
            let contactKey = contactSectionTitlesUpdated[section]
            if let contactValue = contactNameDictionary[contactKey] {
                return contactValue.count
            }
            return 0
        }
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ContactListHeaderView") as? ContactListHeaderView
         headerView?.contactListHeader.text = contactSectionTitlesUpdated[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalCell", for: indexPath) as? PersonalCell
            cell?.contactNameLabel.text = "Jeanette Mchale"
            cell?.mcidLabel.text = "MCID"
            return cell ?? PersonalCell()
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsListCellnew", for: indexPath) as? GroupsListCellnew
            cell?.groupNameLabel.text = groups[indexPath.row]
            return cell  ?? GroupsListCellnew()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCellNew", for: indexPath) as? ContactListCellNew
            let contactKey = contactSectionTitlesUpdated[indexPath.section]
            if let contactValue = contactNameDictionary[contactKey] {
                //cell.textLabel?.text = carValues[indexPath.row]
                cell?.contactNameLabel.text = contactValue[indexPath.row]
                cell?.mcidLabel.text = "MCID"
            }
            return cell ?? ContactListCellNew()
        }
    }
    
//     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //return carSectionTitles[section]
//        return carSectionTitlesUpdated[section]
//    }
    
     func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return contactNameTitles
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 1:
            let memberDetailVc = GroupsListMemberViewController.instantiateFromStoryboard("Contact", storyboardId: "GroupsListMemberViewController")
            self.navigationController?.pushViewController(memberDetailVc, animated: true)
        case 2:
            let memberDetailVc = MemberDetailViewController.instantiateFromStoryboard("Contact", storyboardId: "MemberDetailViewController")
            self.navigationController?.pushViewController(memberDetailVc, animated: true)
        default:
            return
        }
    }

} //class ending
