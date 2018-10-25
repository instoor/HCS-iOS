//
//  PrivateContact.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class PrivateContact: Contact1, Hashable {
    var hashValue: Int {
        return self.email?.hashValue ?? 0
    }
    
    enum Presence {
        case offline
        case online
        case dnd
    }
    
    var email: String?
    var presence: Presence = .dnd
    
    convenience init(urlString: String) {
        self.init(pttUrl: PttUrl.init(urls: urlString))
    }
    
    override init(pttUrl: PttUrl) {
        super.init(pttUrl: pttUrl)
    }
    
    override func getMemberUriList() -> [String] {
        var arrayList = [String]()
        arrayList.append(pttUrl.description())
        return arrayList
    }
    
    override func getTemporaryName() -> String {
        return pttUrl.description()
    }
    
}
