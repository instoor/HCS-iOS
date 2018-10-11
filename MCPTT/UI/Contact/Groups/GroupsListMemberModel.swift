//
//  GroupsListMemberModel.swift
//  MCPTT
//
//  Created by Harman on 10/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

final class GroupsListMemberModel{
    
    private var cellViewModels = [GroupsMembersCell]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var reloadTableViewClosure: (() -> Void)?
    
    func initFetch() {
        processFetchedData()
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> GroupsMembersCell {
        return cellViewModels[indexPath.row]
    }
    private func processFetchedData() {
        // Need to delete this code once API integeration & Model class creation.
        if let path = Bundle.main.path(forResource: "contactslist", ofType: "json") {
            do {
                
                var vms = [GroupsMembersCell]()
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                
                let membersList = jsonResult?["groupContacts"] as? [[String: String]]
                
                for contact in membersList ?? [[:]] {
                    let memberListCellVm = GroupsMembersCell.init(contactName: contact["name"], mcid: contact["mcid"])
                    vms.append(memberListCellVm)
                    
                }
                self.cellViewModels = vms
                
            } catch {
                
            }
        }
    }
    
}
struct GroupsMembersCell {
    let contactName: String?
    let mcid: String?
}
