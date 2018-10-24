//
//  ContactDatabaseModel.swift
//  MCPTT
//
//  Created by Vinayak Naik on 21/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

//Contats Columns
class PrivateContactImpl: NSObject {
    
    var ID                  : Int
    var URI                 : String
    var USER_ID             : Int
    var DISPLAY_NAME        : String
    var EMAIL               : String
    var ON_REQUIRED         : Int
    var USER_PRIORITY       : Int
    var OFF_USER_INFO_ID    : String
    var PARTICIPANT_TYPE    : String
    var ON_RECVONLY         : Int
    var ORGANIZATION        : String
    var GROUP_INFO          : String
    var IS_PROFILE          : Int
    var SEARCH_KEY          : String
    var LIST_LABEL          : String
    var TYPE                : String
    
    override init() {
        self.ID = 0
        self.URI = ""
        self.USER_ID = 0
        self.DISPLAY_NAME = ""
        self.EMAIL = ""
        self.ON_REQUIRED = 0
        self.USER_PRIORITY = 0
        self.OFF_USER_INFO_ID = ""
        self.PARTICIPANT_TYPE = ""
        self.ON_RECVONLY = 0
        self.ORGANIZATION = ""
        self.GROUP_INFO = ""
        self.IS_PROFILE = 0
        self.SEARCH_KEY = ""
        self.LIST_LABEL = ""
        self.TYPE = ""
    }
    
    public func getUserId() -> Int? {
        return USER_ID
    }
    public func getDiplayName() -> String? {
        return DISPLAY_NAME
    }
    public func getOrganization() -> String? {
        return ORGANIZATION
    }
    public func getUserPriority() -> Int? {
        return USER_PRIORITY
    }
    public func getEmail() -> String? {
        return EMAIL
    }
    public func getType() -> String? {
        return TYPE
    }
    
}

//Groups Columns
class GroupContactImpl: NSObject {
    
    var ID: Int
    var URI: String
    var GROUP_ID: String
    var DISPLAY_NAME: String
    var ON_INVITE_MEMBERS: Int
    var ON_MAX_PARTICIPANT: Int
    var ALLOW_EMERGENCY_CALL: Int
    var ALLOW_IMMINENT_CALL: Int
    var ALLOW_EMERGENCY_ALERT: Int
    var ON_ALLOW_GET_MEMBER_LIST: Int
    var ON_ALLOW_GET_AFFILIATION_LIST: Int
    var ON_DISABLED: Int
    var ON_NETWORK_GROUP_PRIORITY: Int
    var OFF_PROSE_LAYER2_GROUP_ID: String
    var OFF_IP_MULTICAST_ADDRESS: String
    var OFF_PDN_TYPE: String
    var OFF_PROSE_SIG_PPPP: Int
    var OFF_PROSE_EMERGENCY_SIG_PPPP: Int
    var OFF_PROSE_IMMINENT_SIG_PPPP: Int
    var OFF_PROSE_MEDIA_PPPP: Int
    var OFF_PROSE_EMERGENCY_MEDIA_PPPP: Int
    var OFF_PROSE_IMMINENT_MEDIA_PPPP: Int
    var OFF_PROSE_RELAY_SERVICE_CODE: String
    var OWNER: String
    var LEVEL_WI_GROUP_HIERARCHY: Int
    var LEVEL_WI_USER_HIERARCHY: Int
    var ON_PROGRESS_EMERGENCY_CANCEL_TIMEOUT: Int
    var ON_PROGRESS_IMMINENT_CANCEL_TIMEOUT: Int
    var OFF_PROGRESS_EMERGENCY_CANCEL_TIMEOUT: Int
    var OFF_PROGRESS_IMMINENT_CANCEL_TIMEOUT: Int
    var ON_HANG_TIMER: Int
    var ON_MAX_DURATION: Int
    var OFF_HANG_TIMER: Int
    var OFF_MAX_DURATION: Int
    var ON_MIN_NUM_START: Int
    var ON_TIMEOUT_ACK_REQ_MEMBER: Int
    var ON_ACTION_EXP_TIMEOUT_ACK_REQ_MEMBER: Int
    var GROUP_KEY_TRANSPORT_PAYLOAD: String
    var PROTECT_MEDIA: String
    var PROTECT_FLOOR_CONTROL_SIG: String
    var REQUIRE_MULTICAST_FLOOR_CONTROL_SIG: String
    var ON_ACK_CALL_AREA: Int
    var ON_PREEMPTION_CAPA: String
    var ON_PREEMPTED_CAPA: String
    var ON_GROUP_FLOOR_CONTROL_SECURITY: String
    var MBMS_SERVICE_AREA: Int
    var RECORDER_USER_ID: String
    var MEMBER_COUNT: String
    var PROFILE_USER_PRIORITY: Int
    var MCPTT_EMERGENCY_GROUP: Int
    var SEARCH_KEY: String
    var GROUP_ETAG: String
    var ALLOW_MODIFY: Int
    var TYPE: String
    
    override init() {
        self.ID = 0
        self.URI = ""
        self.GROUP_ID = ""
        self.DISPLAY_NAME = ""
        self.ON_INVITE_MEMBERS = 0
        self.ON_MAX_PARTICIPANT = 0
        self.ALLOW_EMERGENCY_CALL = 0
        self.ALLOW_IMMINENT_CALL = 0
        self.ALLOW_EMERGENCY_ALERT = 0
        self.ON_ALLOW_GET_MEMBER_LIST = 0
        self.ON_ALLOW_GET_AFFILIATION_LIST = 0
        self.ON_DISABLED = 0
        self.ON_NETWORK_GROUP_PRIORITY = 0
        self.OFF_PROSE_LAYER2_GROUP_ID = ""
        self.OFF_IP_MULTICAST_ADDRESS = ""
        self.OFF_PDN_TYPE = ""
        self.OFF_PROSE_SIG_PPPP = 0
        self.OFF_PROSE_EMERGENCY_SIG_PPPP = 0
        self.OFF_PROSE_IMMINENT_SIG_PPPP = 0
        self.OFF_PROSE_MEDIA_PPPP = 0
        self.OFF_PROSE_EMERGENCY_MEDIA_PPPP = 0
        self.OFF_PROSE_IMMINENT_MEDIA_PPPP = 0
        self.OFF_PROSE_RELAY_SERVICE_CODE = ""
        self.OWNER = ""
        self.LEVEL_WI_GROUP_HIERARCHY = 0
        self.LEVEL_WI_USER_HIERARCHY = 0
        self.ON_PROGRESS_EMERGENCY_CANCEL_TIMEOUT = 0
        self.ON_PROGRESS_IMMINENT_CANCEL_TIMEOUT = 0
        self.OFF_PROGRESS_EMERGENCY_CANCEL_TIMEOUT = 0
        self.OFF_PROGRESS_IMMINENT_CANCEL_TIMEOUT = 0
        self.ON_HANG_TIMER = 0
        self.ON_MAX_DURATION = 0
        self.OFF_HANG_TIMER = 0
        self.OFF_MAX_DURATION = 0
        self.ON_MIN_NUM_START = 0
        self.ON_TIMEOUT_ACK_REQ_MEMBER = 0
        self.ON_ACTION_EXP_TIMEOUT_ACK_REQ_MEMBER = 0
        self.GROUP_KEY_TRANSPORT_PAYLOAD = ""
        self.PROTECT_MEDIA = ""
        self.PROTECT_FLOOR_CONTROL_SIG = ""
        self.REQUIRE_MULTICAST_FLOOR_CONTROL_SIG = ""
        self.ON_ACK_CALL_AREA = 0
        self.ON_PREEMPTION_CAPA = ""
        self.ON_PREEMPTED_CAPA = ""
        self.ON_GROUP_FLOOR_CONTROL_SECURITY = ""
        self.MBMS_SERVICE_AREA = 0
        self.RECORDER_USER_ID = ""
        self.MEMBER_COUNT = ""
        self.PROFILE_USER_PRIORITY = 0
        self.MCPTT_EMERGENCY_GROUP = 0
        self.SEARCH_KEY = ""
        self.GROUP_ETAG = ""
        self.ALLOW_MODIFY = 0
        self.TYPE = ""
    }
}

//Adhoc Groups Columns
class AdhocTableImpl: NSObject {
    var ID: Int
    var URI: String
    var ALLOW_MODIFY: String
    var DISPLAY_NAME: Int
    var MEMBER_URIS: String
    
    override init() {
        self.ID = 0
        self.URI = ""
        self.ALLOW_MODIFY = ""
        self.DISPLAY_NAME = 0
        self.MEMBER_URIS = ""
    }
}

