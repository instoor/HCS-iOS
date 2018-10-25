//
//  AES256Cipher.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 20/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

let maxAdhocMemberCount = 100

enum ChannelType {
    case main
    case sub
    case dormant
}

public enum CallType {
    case restrictedChatGroupCall
    case preArrangendGroup
    case privateGroup
    case adhocGroup
    case broadcastGroup
    case offentGroup
    case invalid
}

enum ChannelMediaType {
    case audio
    case video
    case message
    case none
}

enum CallEndReason {
    case userTriggered
    case lowBattery
    case outOfBattery
    case other
}

enum ContactType: String {
    case GMS = "gms"
    case XDM = "xdm"
}

enum DisconnectCause {
    case unknown
    case error
    case remote
    case rejected
}

enum CallRejectReason {
    case userRejected
    case other
}

enum CommencementMode {
    case none
    case manual
    case auto
    case force
}

enum LoginState {
    case loggedOut
    case loggingIn
    case loggedIn
    case loggingOut
    case unknown
}

enum LoginReason {
    case internalError
    case invalidCredentials
    case netwrokTemporarilyUnavailable
    case noResponseFromServer
    case normal
    case notSupported
    case other
    case serverError
    case noService
    case IMSServiceConnected // it does not come from IMS
}

public enum CallPriority {
    case normal
    case peril
    case emergency
}

enum SessionDirection {
    case incoming
    case outgoing
    case unknown
}

// CallSessionState
enum SessionState {
    case dialing
    case ringing
    case disconnected
    case established
}

enum FtState {
    case ready
    case progress
    case completed
    case error
}

enum FtError {
    case known
    case remoteNotAvailable
    case remoteCanceled
    case remoteNoResponse
    case networkError
    case timeout
    case fileIOError
    case maxSizeExceeded
}

public enum TextMessageType {
    case normal
    case urgent
}

public enum SessionMessageType {
    case miss
    case start
    case end
}

// ModifyCall
enum ModifyCallState {
    case unknown
    case failed
    case success
    case request
}

// ModifyPriorityCall
enum ModifyPriorityCallState {
    case unknonw
    case failed
    case success
    case incoming
}

// FloorState
enum FloorState {
    case unknown
    case idle
    case granted
    case taken
    case rejected
    case queuePosition
    case revoked
    case queuedCancel
    case requestTimeout
    case releaseTimeout
    case requestRelease
    case request
    case release
}

enum Reason {
    case success
    case invalidInput
    case operationNotAllowed
    case imsNotReady
    case notSupported
    case alreadyEstablishedSession
    case d2dNotReady
    case unknow
}

enum ResponseCodes: Int {
    case forbidden = 403
    case methodNotAllowed = 405
    case temporarilyUnavailable = 480
    case notAcceptableHere = 488
}

enum WarningCodes: Int {
    case WC103 = 103
    case WC124 = 12
    case WC127 = 127
}

enum PttWarningCode: Int {
    case none = 0
    case alreadyHaveHalfDuplexVoiceCall = 900
    case alreadyHaveHalfDuplexVodeoCall = 901
    case alreadyHaveFullDuplexVoiceCall = 910
    case alreadyHaveFullDuplexVodeoCall = 911
}

// FetchParticipantStatus
enum FetchParticipantStatus {
    case fetchParticipantStatusSuccess
    case fetchParticipantStatusFail
    case fetchParticipantStatusTerminated
    case fetchParticipantStatusIgnored
}

// PttConferenceParticipantState
enum ConferenceParticipantState {
    case invalid
    case inviting
    case active
    case removing
    case nonActive
    case alerting
    case onHold
    case fail
}

// CmcDocumentType
enum CmcDocumentType {
    case invalids
    case UEConfig
    case userProfile
    case serviceConfig
    case initialUEConfig
    case KMS
}

enum AudioPath {
    case AP
    case CP
}
