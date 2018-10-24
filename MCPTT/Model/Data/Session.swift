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
    
    var id: Int32 = 0
    var connectTime: Int64 = 0
    var disconnectTime: Int64 = 0
    var callReason: Reason = .unknow
    var direction: SessionDirection = .unknown
    var mediaInfo: [MediaInfo] = []
    var isFullyDuplex: Bool = false
    var callType: CallType = .invalid
    var isAmbientListeningCell: Bool = false
    var resourcePriority: Int32 = 0
    var isBroadcast: Bool = false
    var letteringText: String?
    var callPriority: CallPriority = .normal
    var answerMode: CommencementMode = .none
    var isRequestFloor: Bool = false
    var disconnectCause: DisconnectCause = .unknown
    var disconnectCode: Int16 = 0
    var disconnectReason: String?
    var disconnectWarningCode: Int16 = 0
    var state: SessionState = .dialing
    var modifyCallState: ModifyCallState = .unknown
    var modifyPriorityCallState: ModifyPriorityCallState = .unknonw
    var fetchParticipantStatus: FetchParticipantStatus = .fetchParticipantStatusSuccess
    
    init(id: Int32) {
        self.id = id
    }
    
    func setIncomingData(mediaInfo: [MediaInfo], isFullDuplex: Bool, callType: CallType, isAmbientListeningCall: Bool, resourcePriority: Int32, isBroadcast: Bool, letteringText: String, callPriority: CallPriority, answerMode: CommencementMode ) {
        setCommonData(mediaInfo: mediaInfo, isFullDuplex: isFullDuplex, callType: callType, isAmbientListeningCall: isAmbientListeningCall, resourcePriority: resourcePriority, isBroadcast: isBroadcast)
        direction = .incoming
        self.letteringText = letteringText
        self.callPriority = callPriority
        self.answerMode = answerMode
        self.isRequestFloor = false
    }
    
    func setOutgoingData(mediaInfo: [MediaInfo], isFullDuplex: Bool, callType: CallType, isAmbientListeningCall: Bool, resourcePriority: Int32, isBroadcast: Bool, isRequestFloor: Bool, callPriority: CallPriority, answerMode: CommencementMode ) {
        setCommonData(mediaInfo: mediaInfo, isFullDuplex: isFullDuplex, callType: callType, isAmbientListeningCall: isAmbientListeningCall, resourcePriority: resourcePriority, isBroadcast: isBroadcast)
        direction = .outgoing
        letteringText = nil
        self.callPriority = callPriority
        self.answerMode = answerMode
        self.isRequestFloor = isRequestFloor
    }
    
    func setCommonData(mediaInfo: [MediaInfo], isFullDuplex: Bool, callType: CallType, isAmbientListeningCall: Bool, resourcePriority: Int32, isBroadcast: Bool) {
        self.mediaInfo = mediaInfo
        isFullyDuplex = isFullDuplex
        self.callType = callType
        isAmbientListeningCell = isAmbientListeningCall
        self.resourcePriority = resourcePriority
        self.isBroadcast = isBroadcast
    }
    
    func setConnectTime() {
        connectTime = Date().toMilisecond()
    }
    
    func setDisConnectTime() {
        disconnectTime = Date().toMilisecond()
    }
    
    func isOutgoingSession() -> Bool {
        return direction == .outgoing
    }
    
    func isIncomingSession() -> Bool {
        return direction == .incoming
    }
    
    func getMediaType() -> ChannelMediaType {
        return .none
    }
    
    func setDisconnectCause(for disconnectCause: DisconnectCause, code: Int16, reason: String, warningCode: Int16) {
        self.disconnectCause = disconnectCause
        disconnectCode = code
        disconnectReason = reason
        disconnectWarningCode = warningCode
    }
}
