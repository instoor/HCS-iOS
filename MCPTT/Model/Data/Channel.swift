//
//  Channel.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

final class Channel1: Hashable {
    static let tag: String = "ChannelImpl"
    
    var Id: String?
    var status: String?
    var name: String?
    var type: ChannelType = .dormant
    var mediaType: ChannelMediaType = .message
    var callType: CallType = .privateGroup
    var callReason: Reason = .unknow
    var isInoming: Bool = false
    var isOutgoing: Bool = false
    var isEmergencyCallPriority: Bool = false
    var callPriority: CallPriority = .normal
    var floorPriority: Int32 = 0
    var isActiveChannel: Bool = false
    var sessionId: Int32?
    var sessionState: SessionState = .established
    var sessionStartTime: Int64? = 0
    var disconnectCause: DisconnectCause = .error
    var disconnectCode: Int16? = 0
    var disconnectWarningCode: Int16 = 0
    var isAmbientListeningCall: Bool = false
    var isMainType: Bool = false
    var isFullDuplex: Bool = false
    var isHomeType: Bool = false
    var floorState: FloorState = .idle
    var modifyCallState: ModifyCallState = .success
    var modifyPriorityCallState: ModifyPriorityCallState = .failed
    var fetchParticipantStatus: FetchParticipantStatus = .fetchParticipantStatusSuccess
    var updatedTime: Int64? = 0
    var floorSessionConnectTime: Int64? = 0

    //TODO: Need to confirm with android developer about URI
//    var uri: PTTUri?
//    var speakerUri: PTTUri?
    
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
}
