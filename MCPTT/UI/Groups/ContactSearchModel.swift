//
//  ContactSearchModel.swift
//  mcpttapp
//
//  Created by harman on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

final class ContactSearchModel{
    
    private var cellViewModels = [ContactCellSearchModel]() {
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
    
    func getCellViewModel( at indexPath: IndexPath ) -> ContactCellSearchModel {
        return cellViewModels[indexPath.row]
    }
    
    private func processFetchedData() {
        // Need to delete this code once API integeration & Model class creation.
        if let path = Bundle.main.path(forResource: "contactslist", ofType: "json") {
            do {
                
                var vms = [ContactCellSearchModel]()
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                
                let contacts = jsonResult?["contacts"] as? [[String: String]]
                
                for contact in contacts ?? [[:]] {
                    let memberListCellVm = ContactCellSearchModel.init(contactName: contact["name"],  contactAvailablity: contact["availablity"], mcid: contact["mcid"])
                    vms.append(memberListCellVm)
                    
                }
                self.cellViewModels = vms
                
            } catch {
                
            }
        }
    }
    
    
}

struct ContactCellSearchModel {
    let contactName: String?
    let contactAvailablity: String?
    let mcid: String?
    
}
