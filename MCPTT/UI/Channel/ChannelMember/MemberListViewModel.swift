//
//  MemberListViewModel.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

final class MemberListViewModel {
    
    private var cellViewModels = [MemberListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    var reloadTableViewClosure: (() -> Void)?
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func initFetch() {
        processFetchedData()
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> MemberListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    private func processFetchedData() {
        // Need to delete this code once API integeration & Model class creation.
        if let path = Bundle.main.path(forResource: "channelmemberlist", ofType: "json") {
            do {
                
                 var vms = [MemberListCellViewModel]()
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                
                let memebers = jsonResult?["members"] as? [[String: Any]]
                
                for member in memebers ?? [[:]] {
                    let memberListCellVm = MemberListCellViewModel.init(memberName: member["name"] as? String, memberEmail: member["email"] as? String, memberAvailablabilityStatus: member["availablity"] as? String, isMemeberInConatctList: member["isUserContact"] as? Bool ?? false)
                    vms.append(memberListCellVm)
                    
                }
                self.cellViewModels = vms
                
            } catch {
                
            }
        }
    }
}

struct MemberListCellViewModel {
    let memberName: String?
    let memberEmail: String?
    let memberAvailablabilityStatus: String?
    let isMemeberInConatctList: Bool
}
