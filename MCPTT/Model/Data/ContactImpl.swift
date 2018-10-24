//
//  ContactImpl.swift
//  MCPTT
//
//  Created by Vinayak Naik on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class ContactImpl {
    
    var mName: String
    var mOrganization: String
    var mId: Int
    var mPttUrl: PttUrl
    var mEtag: String
    var mFloorPriority: Int
    var mContactType: ContactType
   
    init(pttUrl : PttUrl) {
        mId = -1
        mName = ""
        mOrganization = ""
        mPttUrl = pttUrl
        mEtag = ""
        mContactType = ContactType.GMS
        mFloorPriority = 0
    }
    
    //public abstract List<String> getMemberUriList();
    
    public func getName() -> String {
    if (mName.isEmpty) {
        return getTemporaryName()
    }
    return mName
    }
    
    public func setName(name: String) {
        mName = name
    }
    
    public func getOrganization()-> String {
    return mOrganization
    }
    
    public func setOrganization(organization: String) {
        mOrganization = organization
    }
    
    public func setId(id: Int) {
        mId = id
    }
    
    public func getUri()-> PttUrl {
        return mPttUrl
    }
    
    public func setUri(url: PttUrl) {
        mPttUrl = url
    }
    
    /*
    abstract protected String getTemporaryName();
    
    public boolean equals(Object o) {
    if (o instanceof ContactImpl) {
    ContactImpl comparison = (ContactImpl) o;
    return getUri().equals(comparison.getUri());
    }
    return false;
    }
    */
    public func getEtag()->String {
        return mEtag
    }
    
    public func setEtag(etag: String) {
    mEtag = etag
    }
    
    public func compareTo(another: ContactImpl)-> Int {
        
        //return getName().compareTo(another.getName())
        
        if getName() == another.getName(){
            
        }
        return 1
    
    }
    
    public func getFloorPriority()-> Int {
        return mFloorPriority
    }
    
    public func setFloorPriority(floorPriority: Int) {
    mFloorPriority = floorPriority
    }
    
    public func getContactType()-> ContactType {
    return mContactType
    }
    
    public func setContactType(contactType: ContactType) {
        if (contactType == ContactType.GMS) {
            mContactType = ContactType.GMS
        } else if (contactType == ContactType.XDM) {
            mContactType = ContactType.XDM
        }
    }
    /*
    public func setContactType(contactType: ContactType) {
        mContactType = contactType;
    }
    */
    func getTemporaryName()-> String {
        return /*Resources.getSystem().getString(R.string.temporary_group)*/"Some Name"
    }
}
