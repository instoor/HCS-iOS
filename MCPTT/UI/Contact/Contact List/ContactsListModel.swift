//
//  ContactsListModel.swift
//  mcpttapp
//
//  Created by Raju Maramulla on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

struct ContactsListCellViewModel {
    let contactName: String!
    let contactEmail: String!
    let contactAvailablabilityStatus: String!
}

final class ContactsListModel {
    
    public var cellViewModels = [ContactsListCellViewModel]() {
        didSet {
            self.reloadCollectionViewClosure?()
        }
    }
    var reloadCollectionViewClosure: (() -> Void)?
    
    func initFetch() {
        processFetchedData()
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> ContactsListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    private func processFetchedData() {
        // Need to delete this code once API integeration & Model class creation.
        if let path = Bundle.main.path(forResource: "ContactsData", ofType: "json") {
            do {
                
                var vms = [ContactsListCellViewModel]()
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                
                let contacts = jsonResult?["contacts"] as? [[String: String]]
                
                for contact in contacts ?? [[:]] {
                    let ContactsListCellVM = ContactsListCellViewModel.init(
                        contactName: contact["name"],
                        contactEmail: contact["email"],
                        contactAvailablabilityStatus: contact["availablity"]
                    )
                    vms.append(ContactsListCellVM)
                    
                }
                self.cellViewModels = vms
                print(self.cellViewModels)
                print("List")
            } catch {
                
            }
        }
    }
    
} //class ending
