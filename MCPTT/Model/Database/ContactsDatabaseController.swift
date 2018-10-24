//
//  ContactsDatabaseController.swift
//  MCPTT
//
//  Created by Vinayak Naik on 18/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class ContactsDatabaseController: DatabaseController {
    
    static let contactDbHelperShared = ContactDatabaseHelper()
    static let sInstance = ContactsDatabaseController()
    
    override init() {
    }
    
    /*Cursor*/
    public static func getAllPrivateContact()-> Any{
        /*
         return sInstance.query(ContactsDBTables.CONTACTS,
         privateContactColumns, null, null, null, null);
         */
        return (Any).self
    }
    
    public static func getAllGroupContact()-> Any {
        /*
         return sInstance.query(ContactsDBTables.GROUPS,
         groupContactColumns, null, null, null, null);
         */
        return (Any).self
    }
    
    //MARK: - Get Contact data
    public func getContact(url: PttUrl?) {
        /*
         ContactImpl result = sInstance.mCache.getGroupContact(uri);
         if (result != null) {
         return result;
         
         }
         result = sInstance.mCache.getPrivateContact(uri);
         if (result != null) {
         return result;
         }
         
         Cursor cursor = sInstance.searchGroupContact(uri);
         if (cursor != null) {
         result = getGroupContactImpl(cursor);
         cursor.close();
         return result;
         }
         
         cursor = sInstance.searchPrivateContact(uri);
         if (cursor != null) {
         result = getPrivateContactImpl(cursor);
         cursor.close();
         return result;
         }
         return null;
         */
    }
    
    
    public func getGroupContact(url: PttUrl?) {
        /*
         GroupContactImpl result = sInstance.mCache.getGroupContact(uri);
         if (result != null) {
         return result;
         }
         
         Cursor cursor = sInstance.searchGroupContact(uri);
         if (cursor != null) {
         result = getGroupContactImpl(cursor);
         cursor.close();
         return result;
         }
         
         return null;
         */
    }
    
    
    public func getPrivateContact(url: PttUrl?) {
        /*
         PrivateContactImpl result = sInstance.mCache.getPrivateContact(uri);
         if (result != null) {
         return result;
         }
         
         Cursor cursor = sInstance.searchPrivateContact(uri);
         if (cursor != null) {
         result = getPrivateContactImpl(cursor);
         cursor.close();
         return result;
         }
         
         return null;
         */
    }
    
    
    public func getAdhocContact(url: PttUrl?) {
        /*
         AdhocContactImpl result = sInstance.mCache.getAdhocContact(uri);
         
         if (result != null) {
         return result;
         }
         
         Cursor cursor = sInstance.searchAdhocContact(uri);
         if (cursor != null) {
         result = getAdhocContactImpl(cursor);
         cursor.close();
         return result;
         }
         
         return null;
         */
    }
    
    /* Note: Cursor in android is same like sqlite select query*/
    
    func getGroupContactImpl(cursor : Any) {
        /*
         GroupContactImpl result = null;
         if (cursor.getCount() > 1) {
         Log.e(TAG, "getContact group contact count is over than 1");
         } else if (cursor.getCount() != 0) {
         result = newGroupContact(cursor);
         }
         return result;
         */
    }
    
    func getPrivateContactImpl(cursor : Any) {
        /*
         PrivateContactImpl result = null;
         if (cursor.getCount() > 1) {
         Log.e(TAG, "getPrivateContactImpl count is over than 1");
         } else if (cursor.getCount() != 0) {
         result = newPrivateContact(cursor);
         }
         return result;
         */
    }
    
    func getAdhocContactImpl(cursor : Any) {
        /*
         AdhocContactImpl result = null;
         if (cursor.getCount() > 1) {
         Log.e(TAG, "getAdhocContactImpl count is over than 1");
         } else if (cursor.getCount() != 0) {
         result = newAdhocContact(cursor);
         }
         
         return result;
         */
    }
    
    //MARK: - search contact: private, Adhoc
    func searchPrivateContact(url: PttUrl, cursor: Any){
        /*
         String selection = ContactsColumns.USER_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         
         return query(ContactsDBTables.CONTACTS,
         privateContactColumns, selection, selectionArgs, null, null);
         */
    }
    
    func searchAdhocContact(url: PttUrl, cursor: String){
        /*
         String selection = AdhocGroupsColumns.URI + " = ?";
         String[] selectionArgs = {uri.toString()};
         
         return query(ContactsDBTables.ADHOCGROUPS,
         null, selection, selectionArgs, null, null);
         */
    }
    
    //MARK: - Delete Contact
    private func deletePrivateContactFromDB(url: PttUrl) {
        /*
         String selection = ContactsColumns.USER_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         return delete(ContactsDBTables.CONTACTS, selection, selectionArgs);
         */
    }
    
    private func deleteContactRelationFromDB(url: PttUrl) {
        /*
         String selection = ContactRelationColumns.CONTACT_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         return delete(ContactsDBTables.CONTACT_RELATION, selection, selectionArgs);
         */
    }
    
    private func deleteGroupContactFromDB(url: PttUrl) -> Int{
        /*
         String selection = GroupsColumns.GROUP_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         return delete(ContactsDBTables.GROUPS, selection, selectionArgs);
         */
        return 1
    }
    
    /*groupContact is the file - contact related data in android*/
    public func deleteGroup(groupContact: Any) -> Bool{
        /*
         Log.d(TAG, "delete GroupContact");
         
         if (groupContact.getContactType() != ModelConstants.ContactType.XDM) {
         Log.d(TAG, "only XDM group can be deleted");
         return false;
         }
         
         for (PrivateContactImpl member : groupContact.getContactsList()) {
         deleteContact(member);
         }
         
         int resultCount = deleteGroupContactFromDB(groupContact.getUri());
         if (resultCount == 0) {
         Log.w(TAG, "delete GroupContact from DB is fail");
         Log.w(TAG, "name : " + groupContact.getName());
         return false;
         }
         */
        return true;
        
    }
    
    
    //MARK: - Private Contact Implementation
    private func newPrivateContact(cursor: Any) /* ->PrivateContactImpl*/{
        /*
         PttUri uri = new PttUri(cursor.getString(cursor.getColumnIndex(ContactsColumns.USER_ID)));
         
         PrivateContactImpl contact;
         contact = sInstance.mCache.getPrivateContact(uri);
         if (contact != null) {
         return contact;
         }
         
         contact = InjectionManager.createPrivateContact(uri);
         
         contact.setName(cursor.getString(cursor.getColumnIndex(ContactsColumns.DISPLAY_NAME)));
         contact.setOrganization(cursor.getString(cursor.getColumnIndex(ContactsColumns.ORGANIZATION)));
         contact.setFloorPriority(cursor.getInt(cursor.getColumnIndex(ContactsColumns.USER_PRIORITY)));
         contact.setEmail(cursor.getString(cursor.getColumnIndex(ContactsColumns.EMAIL)));
         contact.setContactType(cursor.getString(cursor.getColumnIndex(ContactsColumns.TYPE)));
         
         sInstance.mCache.add(contact);
         
         return contact;
         */
    }
    
    private func newAdhocContact(cursor: String) /*-> AdhocContactImpl*/{
        /*
         PttUri uri = new PttUri(cursor.getString(cursor.getColumnIndex(AdhocGroupsColumns.URI)));
         
         AdhocContactImpl contact;
         contact = sInstance.mCache.getAdhocContact(uri);
         if (contact != null) {
         return contact;
         }
         
         contact = new AdhocContactImpl(uri);
         
         contact.setName(cursor.getString(cursor.getColumnIndex(AdhocGroupsColumns.DISPLAY_NAME)));
         contact.setAbleModify(cursor.getInt(cursor.getColumnIndex(AdhocGroupsColumns.ALLOW_MODIFY)) == 1);
         String[] memberUriStrings = AdhocContactImpl.getMemberUris(cursor.getString(cursor.getColumnIndex(AdhocGroupsColumns.MEMBER_URIS)));
         
         for(String memberUri : memberUriStrings) {
         PrivateContactImpl memberContact = getPrivateContact(new PttUri(memberUri));
         if (memberContact == null) {
         memberContact = InjectionManager.createPrivateContact(new PttUri(memberUri));
         }
         contact.addMember(memberContact);
         }
         
         return contact;
         */
    }
    
    /*GroupContactImpl groupContact*/
    public func insertContact(groupContact: Any) -> Bool{
        /*if (isExistGroupContact(groupContact.getUri())) {
         return false;
         }
         
         sInstance.insertGroupContactToDb(groupContact);
         sInstance.mCache.add(groupContact);
         return true;
         }
         
         public static boolean insertContact(AdhocContactImpl adhocContact) {
         if (isExistAdhocContact(adhocContact.getUri())) {
         return false;
         }
         
         sInstance.insertAdhocContactToDb(adhocContact);
         sInstance.mCache.add(adhocContact);
         return true;
         }
         
         protected static PrivateContactImpl getPrivateContactImpl(PttUri uri) {
         Cursor cursor = sInstance.searchPrivateContact(uri);
         return getPrivateContactImpl(cursor);
         */
        return false
    }
    
    
    /* Any - Cursor*/
    private func getGroupMembers(groupUri: Any)-> Any{
        /*
         String[] columns = new String[privateContactColumns.length];
         for (int i = 0; i < privateContactColumns.length; i++) {
         columns[i] = ContactsDBTables.CONTACTS + "." + privateContactColumns[i];
         }
         
         String selection = ContactsDBTables.GROUPS + "." + GroupsColumns.GROUP_ID + " = ?";
         String[] selectionArgs = {groupUri.toString()};
         
         //contacts JOIN contact_relation ON (contacts._id = contact_relation.contact_id) JOIN groups ON ( contact_relation.group_id = groups._id)
         String tableBuilder = ContactsDBTables.CONTACTS + " JOIN "
         + ContactsDBTables.CONTACT_RELATION + " ON ( "
         + ContactsDBTables.CONTACTS + "." + ContactsColumns._ID + " = "
         + ContactsDBTables.CONTACT_RELATION + "." + ContactRelationColumns.CONTACT_ID + " ) JOIN "
         + ContactsDBTables.GROUPS + " ON ( " + ContactsDBTables.CONTACT_RELATION + "."
         + ContactRelationColumns.GROUP_ID + " = " + ContactsDBTables.GROUPS + "."
         + GroupsColumns._ID + " )";
         
         String sortOrder = ContactsDBTables.CONTACTS + "." + ContactsColumns.DISPLAY_NAME + " ASC";
         
         return query(tableBuilder, columns, selection, selectionArgs, sortOrder, null);
         */
        return (Any).self
    }
    
    /*PrivateContactImpl*/
    private func insertContactToDb(contact: PrivateContactImpl)-> Int{
        
        let contentValues = [[ContactsColumns.USER_ID           : contact.USER_ID,
                              ContactsColumns.DISPLAY_NAME    : contact.DISPLAY_NAME,
                              ContactsColumns.ORGANIZATION    : contact.ORGANIZATION,
                              ContactsColumns.USER_PRIORITY   : contact.USER_PRIORITY,
                              ContactsColumns.EMAIL           : contact.EMAIL,
                              ContactsColumns.TYPE            : contact.TYPE] as [String : Any]]
        
        return self.insert(table: ContactsDBTables.CONTACTS, contentValues: contentValues)
    }
    
    /*PrivateContactImpl*/
    public func insertContact(Contact: PrivateContactImpl)-> Bool {
        /*
         if (isExistPrivateContact(contact.getUri())) {
         return false;
         }
         */
        _ = self.insertContactToDb(contact: Contact)
        return true
        
    }
    
    /*GroupContactImpl*/
    private func insertGroupContactToDb(groupContact: GroupContactImpl)-> Any {
        
        let contentValues = [[GroupsColumns.GROUP_ID                    : groupContact.GROUP_ID ,
                              GroupsColumns.DISPLAY_NAME                : groupContact.DISPLAY_NAME,
                              GroupsColumns.ON_NETWORK_GROUP_PRIORITY   : groupContact.ON_NETWORK_GROUP_PRIORITY,
                              GroupsColumns.ALLOW_EMERGENCY_ALERT       : groupContact.ALLOW_EMERGENCY_ALERT,
                              GroupsColumns.ALLOW_EMERGENCY_CALL        : groupContact.ALLOW_EMERGENCY_CALL,
                              GroupsColumns.ALLOW_IMMINENT_CALL         : groupContact.ALLOW_IMMINENT_CALL,
                              GroupsColumns.ALLOW_MODIFY                : groupContact.ALLOW_MODIFY,
                              GroupsColumns.TYPE                        : groupContact.TYPE] as [String : Any]]
        
        let groupId : Int = insert(table: ContactsDBTables.GROUPS, contentValues: contentValues)
        
        /*
         long groupId = insert(ContactsDBTables.GROUPS, null, contentValues);
         
         for (PrivateContact privateContact : groupContact.getMemberList()) {
         long memberId = getPrivateContactId(privateContact.getUri());
         if (memberId == 0) {
         memberId = insertContactToDb((PrivateContactImpl) privateContact);
         }
         
         ContentValues contactRelationValues = new ContentValues();
         contactRelationValues.put(ContactRelationColumns.CONTACT_ID, memberId);
         contactRelationValues.put(ContactRelationColumns.GROUP_ID, groupId);
         
         insert(ContactsDBTables.CONTACT_RELATION, null, contactRelationValues);
         }
         
         return groupId;
         */
        return (Any).self
    }
    
    /*AdhocContactImpl*/
    private func insertAdhocContactToDb(adhocContact: AdhocTableImpl)-> Any {
        /*
         ContentValues contentValues = new ContentValues();
         
         contentValues.put(AdhocGroupsColumns.URI, adhocContact.getUri().toString());
         contentValues.put(AdhocGroupsColumns.DISPLAY_NAME, adhocContact.getName());
         contentValues.put(AdhocGroupsColumns.MEMBER_URIS, adhocContact.getMemberUriString());
         contentValues.put(AdhocGroupsColumns.ALLOW_MODIFY, adhocContact.isAbleModify());
         
         return insert(ContactsDBTables.ADHOCGROUPS, null, contentValues);
         */
        
//        let contentValues = [[AdhocGroupsColumns.URI            : adhocContact.URI ,
//                              AdhocGroupsColumns.DISPLAY_NAME   : adhocContact.DISPLAY_NAME,
//                              AdhocGroupsColumns.MEMBER_URIS    : adhocContact.MEMBER_URIS,
//                              AdhocGroupsColumns.ALLOW_MODIFY   : adhocContact.ALLOW_MODIFY] as [String : Any]]
//        
//        return self.insert(ContactsDBTables.ADHOCGROUPS, null, contentValues)
    }
    
    public func isExistPrivateContact(uri: PttUrl) -> Bool{
        /*
         return (sInstance.mCache.getPrivateContact(uri) != null) || (sInstance.getPrivateContactId(uri) != 0);
         */
        return true
    }
    
    private func getPrivateContactId(uri: PttUrl) -> Any {
        /*
         int id = 0;
         String selection = ContactsColumns.USER_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         
         Cursor cursor = query(ContactsDBTables.CONTACTS,
         new String[]{ContactsColumns._ID},
         selection, selectionArgs, null, null);
         
         if (cursor != null) {
         if (cursor.getCount() > 0) {
         id = cursor.getInt(0);
         }
         cursor.close();
         }
         
         return id;
         */
        return (Any).self
    }
    
    public func isExistGroupContact(uri: PttUrl) -> Bool {
        /*
         return (sInstance.mCache.getGroupContact(uri) != null) || (sInstance.getGroupContactId(uri) != 0);
         */
        return false
    }
    
    public func isExistAdhocContact(uri: PttUrl) -> Bool {
        /*
         return (sInstance.mCache.getAdhocContact(uri) != null) || (sInstance.getAdhocContactId(uri) != 0);
         */
        return false
    }
    
    /*Any - cursor*/
    func searchGroupContact(uri: PttUrl) -> Any {
        /*
         String selection = GroupsColumns.GROUP_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         
         return query(ContactsDBTables.GROUPS,
         groupContactColumns, selection, selectionArgs, null, null);
         */
        return (Any).self
    }
    
    
    private func getGroupContactId(uri: PttUrl) -> Any  {
        /*
         int id = 0;
         
         String selection = GroupsColumns.GROUP_ID + " = ?";
         String[] selectionArgs = {uri.toString()};
         
         Cursor cursor = sInstance.query(ContactsDBTables.GROUPS,
         new String[]{GroupsColumns._ID},
         selection, selectionArgs, null, null);
         
         if (cursor != null) {
         if (cursor.getCount() > 0) {
         id = cursor.getInt(0);
         }
         
         cursor.close();
         }
         
         return id;
         */
        return (Any).self
    }
    
    private func getAdhocContactId(uri: PttUrl) -> Any {
        /*
         int id = 0;
         
         String selection = AdhocGroupsColumns.URI + " = ?";
         String[] selectionArgs = {uri.toString()};
         
         Cursor cursor = sInstance.query(ContactsDBTables.ADHOCGROUPS,
         new String[]{AdhocGroupsColumns._ID},
         selection, selectionArgs, null, null);
         
         if (cursor != null) {
         if (cursor.getCount() > 0) {
         id = cursor.getInt(0);
         }
         
         cursor.close();
         }
         
         return id;
         */
        return (Any).self
    }
    
    public func delete(table: String, selection: String, args: [String])-> Any {
        /*
         mCache.clear();
         return super.delete(table, selection, args);
         */
        //let selection : String = ContactsColumns.USER_ID + " = ?";
        //String[] selectionArgs = {uri.toString()};
        //return delete(ContactsDBTables.CONTACTS, selection, selectionArgs);
        
        return (Any).self
    }
    
    public func update(table: String, selection: String, args: [String])-> Any {
        /*
         mCache.clear();
         return super.update(table, updateValues, selection, args);
         */
        return (Any).self
    }
    
    /*PrivateContactImpl contact*/
    public func modifyContactName(contact: Any, newName: Any) {
        /*
         if (!isExistPrivateContact(contact.getUri())
         || contact.getContactType() != ModelConstants.ContactType.XDM) {
         return;
         }
         
         ContentValues contentValues = new ContentValues();
         contentValues.put(ContactsColumns.DISPLAY_NAME, newName);
         String selection = ContactsColumns.USER_ID + " = ?";
         String[] selectionArgs = new String[]{contact.getUri().toString()};
         
         final int count = update(ContactsDBTables.CONTACTS, contentValues, selection, selectionArgs);
         
         Log.d(TAG, "modified row count : " + count);
         */
    }
    
    /*GroupContactImpl group*/
    public func modifyGroupName(group: Any, newName: String) {
        /*
         if (!isExistGroupContact(group.getUri())
         || group.getContactType() != ModelConstants.ContactType.XDM) {
         return;
         }
         
         ContentValues contentValues = new ContentValues();
         contentValues.put(GroupsColumns.DISPLAY_NAME, newName);
         String selection = GroupsColumns.GROUP_ID + " = ?";
         String[] selectionArgs = new String[]{group.getUri().toString()};
         
         final int count = update(ContactsDBTables.GROUPS, contentValues, selection, selectionArgs);
         
         Log.d(TAG, "modified row count : " + count);
         */
    }
    
    
}


