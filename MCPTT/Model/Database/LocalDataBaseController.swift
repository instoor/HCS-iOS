//
//  LocalDataBaseController.swift
//  MCPTT
//
//  Created by Toor, Sanju on 18/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import SQLite3
class LocalDatabaseController: DatabaseController {
    
    fileprivate let  TAG = "LocalDBController"
    fileprivate var LocalDBController = LocalDatabaseController()
    
    override init() {
    }
    
    private func insertMessage( message: Message) {
        
        // TODO: Need to implement LoggedInUserImpl.getInstance().getUri().toString() and also Need to change this code after confirmation
//        let sqlQuery = "INSERT INTO \(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_USER_URI), \(MessageColumns.MESSAGE_SESSION_ID_ENTRY)) VALUES (\(LoggedInUserImpl.getInstance().getUri().toString()),\(message.sessionId), \(message.time))"
//
//        if (message.getGroupUrl() != nil) {
//            let sqlQuery = "INSERT INTO \(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_CHANNEL_URI_ENTRY)) VALUES (\(message.getGroupUrl()))"
//        }
//
//        if !message.peerUrl.isEmpty {
//            let sqlQuery = "INSERT INTO \(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_SENDER_URI_ENTRY)) VALUES (\(message.peerUrl)))"
//            if (message.getGroupUrl() == nil) {
//                // Private channel
//                let sqlQuery = "INSERT INTO \(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_CHANNEL_URI_ENTRY)) VALUES (\(message.peerUrl)))"
//            }
//        }
//
//        let sqlQuery = "INSERT INTO \(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_CALL_TYPE), \(MessageColumns.MESSAGE_TYPE), \(MessageColumns.MESSAGE_IS_SENT_ENTRY), \(MessageColumns.MESSAGE_IS_READ_ENTRY)) VALUES (\(message.callType),\(message.type()), \(message.isOutgoing), \(message.isRead))"
    }

    public func insertMessage(message: TextMessage) -> Int {
        //TODO:  Need to add encryption for this method  ModelCipher.encrypt(message.getContentBody()
        let tableName = "\(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_IM_BODY_ENTRY), \(MessageColumns.MESSAGE_IS_SITUATION_ENTRY))"
        let contentValues = "\(message.getContentBody()),\(message.getTextMessageType())"
        return insert(table: tableName, contentValues: contentValues)
        
    }
    
    //TODO: getEndTime method needs to implement in FloorMessage Class
//    public func insertMessage(message: FloorMessage) -> Int {
//        let tableName = "\(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_END_TIME))"
//        let contentValues = "\(message.getEndTime())"
//        return insert(table: tableName, contentValues: contentValues)
//        
//    }

    public func insertMessage(message: SessionMessage) -> Int {
        let tableName =  "\(LocalDBTables.MESSAGE_DATABASE_TABLE)( \(MessageColumns.MESSAGE_IS_SENT_ENTRY), \(MessageColumns.MESSAGE_CALL_PRIORITY))"
        let contentValues = "\(message.sessionMessageType), \(message.callPriority)"
        return insert(table: tableName, contentValues: contentValues)
        
    }

    public func updateFloorMessage(floorSessionId: Double, endTime: Double,  isRecordMode: Bool,  recordFilePath: String) {
        
        guard !isRecordMode else {
            let tableName =  "\(LocalDBTables.MESSAGE_DATABASE_TABLE)"
            let updateValues = "\(MessageColumns.MESSAGE_FT_URI_ENTRY)  = \(recordFilePath)"
            let whereClause = "\(MessageColumns.MESSAGE_ID_ENTRY) = \(floorSessionId)"
            update(table: tableName, updateValues: updateValues, whereClause: whereClause)
            return
        }
        
        let tableName =  "\(LocalDBTables.MESSAGE_DATABASE_TABLE)"
        let updateValues = "\(MessageColumns.MESSAGE_END_TIME)  = \(endTime)"
        let whereClause = "\(MessageColumns.MESSAGE_ID_ENTRY) = \(floorSessionId)"
        update(table: tableName, updateValues: updateValues, whereClause: whereClause)
}

    //TODO: channel.Uri need to be confirmed in this method
//   public func updateMessageRead( channel: Channel1) -> Int {
//        let tableName = "\(LocalDBTables.MESSAGE_DATABASE_TABLE)"
//        let updateValues = "\(MessageColumns.MESSAGE_IS_READ_ENTRY) = 1"
//        let whereClause = "\(MessageColumns.MESSAGE_IS_READ_ENTRY) = 0 AND \(MessageColumns.MESSAGE_CHANNEL_URI_ENTRY) = \(channel.getUri())"
//        let count = update(table:tableName , updateValues: updateValues, whereClause: whereClause)
//        return count
//   }
    
    // TODO: Depend on the database Controller,Floor Message for select query and coulmn Index things
//    public func getMessageType( cursor: Cursor) -> Message.Type {
//        return Message.Type.values()[cursor.getInt(cursor.getColumnIndex(MessageColumns.MESSAGE_TYPE))];
//    }
//
//
//    public func getMessage(cursor: Cursor) -> Message {
//        let msg: Message
//        let type = getMessageType(cursor)
//        let sessionId = cursor.getInt(cursor.getColumnIndex(MessageColumns.MESSAGE_SESSION_ID_ENTRY))
//        let groupUrl = PttUrl(urls:cursor.getString(cursor.getColumnIndex(MessageColumns.MESSAGE_CHANNEL_URI_ENTRY)) )
//        let peerUrl = PttUrl(urls:cursor.getString(cursor.getColumnIndex(MessageColumns.MESSAGE_SENDER_URI_ENTRY)) )
//        let callType = CallType.values()[cursor.getInt(cursor.getColumnIndex(MessageColumns.MESSAGE_CALL_TYPE))]
//        let startTime = cursor.getLong(cursor.getColumnIndex(MessageColumns.MESSAGE_START_TIME))
//        let endTime = cursor.getLong(cursor.getColumnIndex(MessageColumns.MESSAGE_END_TIME))
//        let isOutgoing = cursor.getInt(cursor.getColumnIndex(MessageColumns.MESSAGE_IS_SENT_ENTRY)) == 1
//        let isRead = cursor.getInt(cursor.getColumnIndex(MessageColumns.MESSAGE_IS_READ_ENTRY)) == 1
//        let recordPath = cursor.getString(cursor.getColumnIndex(MessageColumns.MESSAGE_FT_URI_ENTRY))
//
//        switch (type) {
//            case text:
//                let textEncrypted = cursor.getString(cursor.getColumnIndex(MessageColumns.MESSAGE_IM_BODY_ENTRY))
//                let text = MessageBodyCache.getInstance().get(textEncrypted)
//                if (text == nil) {
//                    text = ModelCipher.decrypt(textEncrypted)
//                    MessageBodyCache.getInstance().put(textEncrypted, text)
//                }
//                let  msgType = TextMessageType.values()[cursor.getInt(cursor.getColumnIndex(DatabaseConstants.MessageColumns.MESSAGE_IS_SITUATION_ENTRY))];
//                msg =  TextMessage(sessionId: sessionId, peerUrl: peerUrl, groupUrl: groupUrl, callType: callType, chatId: sessionId, contentType: nil, contentBody: text, textMessageType: msgType, time: startTime, isOutgoing: isOutgoing)
//        break;
//
//        case floor:
//            // TODO: Depend on the floor message class implementation.
////        FloorMessage floorMessage = FloorMessage(sessionId, peerUri, groupUri, callType, startTime, isOutgoing)
////        floorMessage.setEndTime(endTime)
////        floorMessage.setRecordPath(recordPath)
////        msg = floorMessage;
//        break;
//
//        case file:
//        // Not support FTDATA ATT day1 requirement
//        break;
//
//        case session:
//            let callPriority = CallPriority.values()[cursor.getInt(cursor.getColumnIndex(DatabaseConstants.MessageColumns.MESSAGE_CALL_PRIORITY))];
//            let  sessionMessageType = SessionMessageType.values()[cursor.getInt(cursor.getColumnIndex(DatabaseConstants.MessageColumns.MESSAGE_IS_SENT_ENTRY))];
//            msg = SessionMessage(sessionId, groupUrl: peerUrl, callType: callType, callPriority: callPriority, time: startTime, sessionMessageType: sessionMessageType)
//        break;
//        }
//
//        if (msg != nil && isRead) {
//            msg.setRead();
//        }
//
//        return msg;
//        }
    
    public func getMessageCursor( channel: Channel1) {
   
    }
    
    public func getUnReadMessageCnt( channel: Channel1) -> Int {
        return 0
    }
    
    public func getUnReadSituationMessageCnt( channel: Channel1) -> Int {
        return 0
    }
    
    public func getUnreadMessageCursor( isSituationMessage: Bool) {
        
    }
    
}
