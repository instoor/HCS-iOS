//
//  AdhocContactImpl.swift
//  MCPTT
//
//  Created by Vinayak Naik on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class AdhocContactImpl{
    //public final String ADHOC_CONTACT_TYPE = "ADHOC";
    
    public func AdhocContactImpl(pttUrl: PttUrl) {
        //this(pttUrl, false);
    }
    
    public func AdhocContactImpl() {
        //this(newPttUri(), true);
    }
    
    public func AdhocContactImpl(pttUrl: PttUrl, isModifiable: Bool) {
        //super(newPttUri());
        //setAbleModify(isModifiable)
        //setContactType(ADHOC_CONTACT_TYPE)
    }
    
    /*
    private static func newPttUri()-> PttUrl {
        String uri = Long.toString(System.currentTimeMillis());
        return new PttUri(ADHOC_SCHEME + uri);
    }
    */
    
    /*
    public func addMember(privateContact )-> Bool {
        if (getMemberCount() >= ModelConstants.MAX_ADHOC_MEMBER_COUNT) {
            return false;
        }
        addMember((PrivateContactImpl) privateContact);
        return true;
    }
    
    public boolean addMembers(List<PrivateContact> privateContactList) {
        if (getMemberCount() + privateContactList.size() > ModelConstants.MAX_ADHOC_MEMBER_COUNT) {
            return false;
        }
        
        for (PrivateContact privateContact : privateContactList) {
            addMember((PrivateContactImpl) privateContact);
        }
        return false;
    }
    
    public String getMemberUriString() {
        List<String> memberUriList = getMemberUriList();
        StringBuilder memberUriString = new StringBuilder();
        for (String uri : memberUriList) {
            memberUriString.append(uri).append(";");
        }
        
        return memberUriString.toString();
    }
    
    public static String[] getMemberUris(String memberUris) {
        ArrayList<PttUri> memberUriList = new ArrayList<>();
        return memberUris.split(";");
    }
    
    @Override
    protected String getTemporaryName() {
        return Resources.getSystem().getString(R.string.temporary_adhoc_group);
    }
 */
}
