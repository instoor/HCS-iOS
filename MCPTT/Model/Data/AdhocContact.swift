//
//  AdhocContact.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class AdhocContact: GroupContact {
    public let adhocContactType: String = "ADHOC"
    
    override convenience init(pttUrl: PttUrl) {
        self.init(pttUrl: pttUrl, isModifiable: false)
    }
    
    convenience init() {
        let uriString = String(Date().toMilisecond())
        self.init(pttUrl: PttUrl.init(urls: "\(PttUrl.ADHOC_SCHEME)\(uriString)" ), isModifiable: true)
    }
    
    init(pttUrl: PttUrl, isModifiable: Bool) {
        super.init(pttUrl: pttUrl)
        isAbleModify = isAbleModify
        setContactType(contactType: adhocContactType)
    }
    
    func addMember(member: PrivateContact) -> Bool {
        if getMemberCount() >= maxAdhocMemberCount {
            return false
        }
        super.addMember(member: member)
        return true
    }
    
    func addMembers(privateMembers: [PrivateContact]) -> Bool {
        if getMemberCount() + privateMembers.count > maxAdhocMemberCount {
            return false
        }
        
        for privateContact in privateMembers {
            super.addMember(member: privateContact)
        }
        // TODO: Android return false here, But i think, return should be true. Need to figure out during using this method
        return false
    }
    
    func getMemberUrlString() -> String {
        let memberUrlList = getMemberUriList()
        return memberUrlList.joined(separator: ";")
    }
    
    func getMemberUrls(memberUrl: String) -> [String] {
        let splitString = memberUrl.components(separatedBy: ";")
        return splitString
    }
    
    override func getTemporaryName() -> String {
        // TODO: Android taken this string from resource file. we need to check whats is the hard coded string there.
        return "Hardcoded value"
    }
}
