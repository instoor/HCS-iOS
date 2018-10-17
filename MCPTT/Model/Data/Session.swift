//
//  Session.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class Session {
    static let invalidId: Int32 = -1
    
    var mId: Int32 = 0
    var mConnectTime: Int64 = 0
    var mDisconnectTime: Int64 = 0
    var mCallReason: Reason = .unknow
    var mDirection: SessionDirection = .unknown
    var mMediaInfo: [MediaInfo] = []
    var mIsFullyDuplex: Bool = false
    var mCallType: CallType = .invalid
    var mIsAmbientListeningCell: Bool = false
    var mResourcePriority: Int32 = 0
    var mIsBroadcast: Bool = false
    var mLetteringText: String?
    var mCallPriority: CallPriority = .normal
    var mAnswerMode: CommencementMode = .none
    var mRequestFloor: Bool = false
    var mDisconnectCause: DisconnectCause = .unknown
    var mDisconnectCode: Int32 = 0
    var mDisconnectReason: String?
    var mDisconnectWarningCode: Int32 = 0
    var mState: SessionState = .dialing
    var mModifyCallState: ModifyCallState = .unknown
    var mModifyPriorityCallState: ModifyPriorityCallState = .unknonw
    var mFetchParticipantStatus: FetchParticipantStatus = .fetchParticipantStatusSuccess
    
    init(id: Int32) {
        self.mId = id
    }
    
    func setIncomingData(mediaInfo: [MediaInfo], isFullDuplex: Bool, callType: CallType, isAmbientListeningCall: Bool, resourcePriority: Int32, isBroadcast: Bool, letteringText: String, callPriority: CallPriority, answerMode: CommencementMode ) {
        setCommonData(mediaInfo: mediaInfo, isFullDuplex: isFullDuplex, callType: callType, isAmbientListeningCall: isAmbientListeningCall, resourcePriority: resourcePriority, isBroadcast: isBroadcast)
        mDirection = .incoming
        mLetteringText = letteringText
        mCallPriority = callPriority
        mAnswerMode = answerMode
        mRequestFloor = false
    }
    
    func setOutgoingData(mediaInfo: [MediaInfo], isFullDuplex: Bool, callType: CallType, isAmbientListeningCall: Bool, resourcePriority: Int32, isBroadcast: Bool, isRequestFloor: Bool, callPriority: CallPriority, answerMode: CommencementMode ) {
        setCommonData(mediaInfo: mediaInfo, isFullDuplex: isFullDuplex, callType: callType, isAmbientListeningCall: isAmbientListeningCall, resourcePriority: resourcePriority, isBroadcast: isBroadcast)
        mDirection = .outgoing
        mLetteringText = nil
        mCallPriority = callPriority
        mAnswerMode = answerMode
        mRequestFloor = isRequestFloor
    }
    
    func setCommonData(mediaInfo: [MediaInfo], isFullDuplex: Bool, callType: CallType, isAmbientListeningCall: Bool, resourcePriority: Int32, isBroadcast: Bool) {
        mMediaInfo = mediaInfo
        mIsFullyDuplex = isFullDuplex
        mCallType = callType
        mIsAmbientListeningCell = isAmbientListeningCall
        mResourcePriority = resourcePriority
        mIsBroadcast = isBroadcast
    }
    
    func setConnectTime() {
        mConnectTime = Date().toMilisecond()
    }
    
    func setDisConnectTime() {
        mDisconnectTime = Date().toMilisecond()
    }
    
    func isOutgoingSession() -> Bool {
        return mDirection == .outgoing
    }
    
    func isIncomingSession() -> Bool {
        return mDirection == .incoming
    }
    
    func setDisconnectCause(for disconnectCause: DisconnectCause, code: Int32, reason: String, warningCode: Int32) {
        mDisconnectCause = disconnectCause
        mDisconnectCode = code
        mDisconnectReason = reason
        mDisconnectWarningCode = warningCode
    }
}
