//
//  Channel.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

final class Channel1: Hashable, Equatable, Comparable {
    
    static let tag: String = "ChannelImpl"
    
    var Id: String?
    var status: String?
    var name: String = ""
    var channeltype: ChannelType = .dormant
    var mediaType: ChannelMediaType {
        return session.getMediaType()
    }
    var callType: CallType = .privateGroup
    var callReason: Reason {
        return session.callReason
    }
    var isInoming: Bool {
        return session.isIncomingSession()
    }
    var isOutgoing: Bool {
        return session.isOutgoingSession()
    }
    var isEmergencyCallPriority: Bool {
        return callPriority == .emergency
    }
    var callPriority: CallPriority = .normal
    var floorPriority: Int32 = 0
    var isActiveChannel: Bool {
        return session.id != Session.invalidId
    }
    var sessionId: Int32 {
        return session.id
    }
    var sessionState: SessionState {
        return session.state
    }
    var sessionStartTime: Int64 {
        return session.connectTime
    }
    var disconnectCause: DisconnectCause {
        return session.disconnectCause
    }
    var disconnectCode: Int16 {
        return session.disconnectCode
    }
    var disconnectWarningCode: Int16 {
        return session.disconnectWarningCode
    }
    var isAmbientListeningCall: Bool {
        return session.isAmbientListeningCell
    }
    var isMainType: Bool {
        return channeltype == .main
    }
    var isFullDuplex: Bool {
        return session.isFullyDuplex
    }
    var isHomeType: Bool = false
    var floorState: FloorState {
        return floorSession.floorState
    }
    var modifyCallState: ModifyCallState {
        return session.modifyCallState
    }
    var modifyPriorityCallState: ModifyPriorityCallState {
        return session.modifyPriorityCallState
    }
    var fetchParticipantStatus: FetchParticipantStatus {
        return session.fetchParticipantStatus
    }
    var updatedTime: Int64 = 0
    var floorSessionConnectTime: Int64 {
        return floorSession.floorConnectTime
    }

    var pttUrl: PttUrl
    var speakerUri: PttUrl {
        return floorSession.peerUrl
    }
    var session: Session = Session(id: Session.invalidId)
    var floorSession: FloorSession = FloorSession(id: FloorSession.invalidId)
    
    var thumbnailImageName: String?
    var iconImageName: String?
    var newReceiveddMessagecount: String?
    var missedPTTCount: String?
    var pttCallIconImageName: String?
    var broadcastMessageImageName: String?
    var channelStatusDescription: String?

    var hashValue: Int {
        return self.Id?.hashValue ?? 0
    }
    
    static func ==(lhs: Channel1, rhs: Channel1) -> Bool {
        return lhs.Id == rhs.Id
    }
    
    static func < (lhs: Channel1, rhs: Channel1) -> Bool {
        return lhs.Id == rhs.Id
    }
    private func getChannelPriority() -> Int64 {
        var priority: Int64 = 0
        switch channeltype {
        case .main:
            priority += 0
        case .sub:
            priority += 1000
        case .dormant:
            priority += 2000
        }
        
        if isHomeType {
            priority += 0
        } else {
            priority += 100
        }
        
        switch callPriority {
        case .emergency:
            priority += 10
        case .peril:
            priority += 20
        case .normal:
            priority += 30
        }
        
        switch callType {
        case .preArrangendGroup:
            priority += 0
        case .privateGroup:
            priority += 1
        case .adhocGroup:
            priority += 1
        default:
            priority += 2
        }
        
        return priority
    }
    
    func compareTo(channel: Channel1) -> Int64 {
        if self == channel {
            return 0
        }
        
        var result = self.getChannelPriority() - channel.getChannelPriority()
        if result == 0 {
            result = channel.updatedTime - self.updatedTime
        }
        return result
    }
    
    init() {
       self.pttUrl = PttUrl.init(urls: "")
    }
    
    init(pttUrl: PttUrl) {
        self.pttUrl  = pttUrl
        updatedTime = Date().toMilisecond()
    }
    
}
