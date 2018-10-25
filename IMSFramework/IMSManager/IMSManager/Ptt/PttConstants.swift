//
//  PttConstants.swift
//  IMSManager
//
//  Created by Abhishek Shrivastava on 10/23/18.
//  Copyright © 2018 Abhishek Shrivastava. All rights reserved.
//

import Foundation

/**
 * The type Ptt constants.
 */
public class PttConstants {

    public static let SERVICE_NOT_READY = "service not ready"
    /**
     * Represents the type of PTT service requesting
     */
    public class ServiceType {
        /**
         * Private Constructor
         */
//        private ServiceType() {
//        throw new IllegalStateException("ServiceType is a Utility class");
//        }
        /**
         * Business releated PTT service
         */
        public static let B2BPTT: Int = 0
        /**
         * Mission critical PTT service
         */
        public static let MCPTT: Int = 1

        /**
         * for Adhoc group
         */
        public static let ADHOC_GROUP: Int = 3
        /**
         * for off-network
         */
        public static let OFFNET_GROUP_CALL: Int = 4
        public static let MAX: Int = 5
        public static func isValid(value: Int) -> Bool {
        if(value<B2BPTT||value>=MAX) {
        return false
        }
        return true
        }
    }
    /**
     * Represents the type of call user is requesting
     */
    public class CallType {
        /**
         * Private Constructor
         */
//        private CallType() {
//        throw new IllegalStateException("CallType is a Utility class");
//        }
        /**
         * Restricted chat group call
         */
        public static let RESTRICTED_CHAT_GROUP_CALL:Int = 0
        /**
         * Group call between pre arranged set of Group users
         */
        public static let PRE_ARRANGED_GROUP:Int = 1
        /**
         * Private call between two MCPTT UE's
         */
        public static let PRIVATE:Int = 2
        /**
         * for Adhoc group
         */
        public static let ADHOC_GROUP:Int = 3
        /**
         * for Broadcast group
         */
        public static let  BROADCAST_GROUP:Int = 4
        /**
         * for Offnet group
         */
        public static let OFFNET_GROUP:Int = 5
        
        public static let MAX:Int = 6
        
        public static func isValid(value:Int) -> Bool {
        if(value<RESTRICTED_CHAT_GROUP_CALL||value>=MAX) {
        return false
            
            }
        return true
        }
    }
    
    /**
     * Priority of the floor is being requested
     */
    public class FloorPriority {
        /**
         * Private Constructor
         */
//        private FloorPriority() {
//        throw new IllegalStateException("FloorPriority is a Utility class");
//        }
        /**
         * Normal priority for floor request, requests can be queued and processed in order of
         * availability
         */
        public static let NORMAL: Int = 0
        /**
         * High priority means will get priority in queue and immediately override
         * if floor taken uri has less priority
         */
        public static let HIGH:Int = 1
        /**
         * Very high priority in a group only one user has this capability and he
         * can override any floor and can support dual floor
         */
        public static let PREEMPTIVE: Int = 2
        
        public static let MAX: Int = 3
        
        public static func isValid(value: Int) ->Bool{
        if(value<NORMAL||value>=MAX){
        return false
        }
        return true
        }
    }
    
    /**
     * Representing channel type for a session, based on this media will be played.
     */
    public  class ChannelType {
        
        /**
         * Private Constructor
         */
//        private ChannelType() {
//        throw new IllegalStateException("ChannelType is a Utility class");
//        }
        /**
         * UE neither send not receive media in this channel type
         */
        public static let DORMANT: Int = 0
        /**
         * UE can send/receive media in this channel type, only one channel of this type possible
         */
        public static let MAIN: Int = 1
        /**
         * UE can only receive media in this channel type, only one channel of this type possible
         */
        public static let SUB: Int = 2
        
        public static let MAX: Int = 3
        
        public static func isValid(value: Int) -> Bool{
        if(value<DORMANT||value>=MAX){
        return false
        }
        return true
        }
    }
    /**
     * Represents the direction of the media.
     */
    public class MediaDirection {
        /**
         * Private Constructor
         */
//        private MediaDirection() {
//        throw new IllegalStateException("MediaDirection is a Utility class");
//        }
        /**
         * Not specified media direction
         */
        public static let NONE = 0
        /**
         * Only send media
         */
        public static let TX = 1
        
        /**
         * Only received media
         */
        public static let RX = 2
        
        /**
         * Both send and receive
         */
        public static let TX_RX = 3
        /**
         * No media flow, if user set no flow then media direction will be inactive
         */
        public static let INACTIVE = 4
        
        public static let MAX = 5
        
        public static func isValid(value: Int)-> Bool{
        if(value<=NONE||value>=MAX){
        return false
        }
        return true
        }
    }
    
    /**
     * Represents streaming type
     */
    public class MediaType {
        /**
         * Private Constructor
         */
//        private MediaType() {
//        throw new IllegalStateException("MediaType is a Utility class");
//        }
        /**
         * No media direction specified
         */
        public static let  NONE = 0
        /**
         * Audio stream
         */
        public static let  AUDIO = 1
        
        /**
         * video stream
         */
        public static let  VIDEO = 2
        
        /**
         * Text streaming
         */
        public static let  MESSAGE = 3
        
        public static let  MAX = 4
        
        public static func isValid(value: Int)->Bool{
        if(value<=NONE||value>=MAX){
        return false
        }
        return true
        }
    }
    /**
     * Represents session type for establishing a call.
     */
    public class SessionType {
        /**
         * Private Constructor
         */
//        private SessionType() {
//        throw new IllegalStateException("SessionType is a Utility class");
//        }
        /**
         * On demand call is made when user make call
         */
        public static let ONDEMAND = 0
        
        /**
         * Using already established call for this session
         */
        public static let PREESTABLISHED = 1
        public static let MAX = 3
        public static func isValid(value:Int)->Bool {
        if(value<ONDEMAND||value>=MAX) {
        return false
            }
        return true
            
        }
    }
    
    /**
     * Represents priority of the call user is requesting, higher priorities needs privileges
     */
    public  class CallPriority {
        
        /**
         * Private Constructor
         */
//        private CallPriority() {
//        throw new IllegalStateException("CallPriority is a Utility class");
//        }
        
        /**
         * The constant NORMAL.
         */
        public static let NORMAL = 0
        /**
         * The constant PERIL.
         */
        public static let PERIL = 1
        /**
         * The constant EMERGENCY.
         */
        public static let EMERGENCY = 2
        
        public static let MAX = 3
        
        public static func isValid(value:Int)->Bool {
        if(value<NORMAL||value>=MAX) {
        return false
            }
        return true
            
        }
    }
    
    /**
     * Represent possible states of floor.
     */
    public class FloorStatus {
        
        /**
         * Private Constructor
         */
//        private FloorStatus() {
//        throw new IllegalStateException("FloorStatus is a Utility class");
//        }
        
        /**
         * No participant has floor
         */
        public static let IDLE = 0
        
        /**
         * Currently UE has granted floor.
         */
        public static let GRANTED = 1
        
        /**
         * Other participants has taken floor
         */
        public static let TAKEN = 2
        
        /**
         * Floor request is queued
         */
        public static let QUEUEd = 3
        
        public static let MAX = 4
        
        public static func isValid(value:Int)->Bool {
        if(value<IDLE||value>=MAX) {
        return false
            }
        return true
            
        }
    }
    
    /**
     * specifies the commencement mode requested by user before making call
     */
    public class CommencementMode {
        
        /**
         * Private Constructor
         */
//        private CommencementMode() {
//        throw new IllegalStateException("CommencementMode is a Utility class");
//        }
        
        /**
         * Not specified
         */
        public static let NONE = 0
        
        /**
         * Requesting user to manual answer
         */
        public static let MANUAL = 1
        
        /**
         * Requesing auto answer on the remote side.
         */
        public static let AUTO = 2
        
        /**
         * Requesting force ful answer, only applicable for private calls.
         */
        public static let FORCE = 3
        
        public static let MAX = 3
        public static func isValid(value:Int)->Bool {
        if(value<=NONE||value>=MAX) {
        return false
            
            }
        return true
            
        }
    }
    
    /**
     * Represents Communication type of the media
     */
    public  class CommunicationType {
        
        /**
         * Private Constructor
         */
//        private CommunicationType() {
//        throw new IllegalStateException("CommunicationType is a Utility class");
//        }
        
        /**
         * Default communication both Uplink and downlink allowed in the bearer
         */
        public static let UNI_CAST = 0
        
        /**
         * Only down link.
         */
        public static let MULTI_CAST = 1
        public static let MAX = 2
        public static func isValid(value:Int)->Bool {
        if(value<UNI_CAST||value>=MAX) {
        return false
            }
        return true
            
        }
    }
    
    /**
     * The type User type.
     */
    public class UserType {
        
        /**
         * Private Constructor
         */
//        private UserType() {
//        throw new IllegalStateException("UserType is a Utility class");
//        }
        
        /**
         * The constant NONE.
         */
        public static let NONE = 0
        /**
         * The constant TO.
         */
        public static let TO = 1
        /**
         * The constant CC.
         */
        public static let CC = 2
        /**
         * The constant BCC.
         */
        public static let BCC = 3
        
        public static let MAX = 4
        
        public static func isValid(value:Int)->Bool {
        if(value<NONE||value>=MAX) {
        return false
            
            }
        return true
            
        }
    }
    
    /**
     * Specifies the type of the uri
     */
    public class UriUsageType {
        
        /**
         * Private Constructor
         */
//        private UriUsageType() {
//        throw new IllegalStateException("UriUsageType is a Utility class");
//        }
        
        /**
         * Uri usage type is undetermined, can be used for anything
         */
        public static let ANY = 0
        /**
         * uri usage is for TOKEN data
         */
        public static let TOEKN = 1
        /**
         * uri usage is for User data
         */
        public static let USER = 2
        /**
         * uri usage is for Group data
         */
        public static let GROUP = 3
        public static let MAX = 4
        public static func isValid(value:Int)->Bool {
        if(value<ANY||value>=MAX) {
        return false
        }
        return true
            
        }
    }
    
    /**
     * Specifies uri scheme
     */
    public class UriType {
        
        /**
         * Private Constructor
         */
//        private UriType() {
//        throw new IllegalStateException("UriType is a Utility class");
//        }
        
        /**
         * The constant NONE.
         */
        public static let NONE = 0
        /**
         * The constant SIP.
         */
        public static let SIP = 1
        /**
         * The constant SIPS.
         */
        public static let SIPS = 2
        /**
         * The constant TEL.
         */
        public static let TEL = 3
        /**
         * The constant URN.
         */
        public static let URN = 4
        
        public static let MAX = 5
        public static func convertUriType(str:String)->Int {
            return modifyUriType(str: str)
            
        }
        
        public static func isValid(value:Int)->Bool {
        if(value<NONE||value>=MAX) {
        return false
            
            }
        return true
            
        }
    }
    
    /**
     * Api to convert uri type to integer value
     *
     * @param str uri value
     * @return a constant
     */
    private static func modifyUriType(str:String)->Int {
        var type = UriType.NONE
        if(str != nil){
    if("sip" == str) {
    type = UriType.SIP
        
    } else  if("sips" == str) {
    type = UriType.SIPS
        
    }else  if("tel" == str){
    type = UriType.TEL
        
    }else  if("urn" == str){
    type = UriType.URN
        
            }
    }
    
    return type
        
    }
    
    /**
     * Represents call end reasons
     */
    public  class CallEndReasons {
        
//        /**
//         * Private Constructor
//         */
//        private CallEndReasons() {
//        throw new IllegalStateException("CallEndReasons is a Utility class");
//        }
//
        public static let USER_TRIGGERED = 0
        public static let LOW_BATTERY = 1
        public static let OUT_OF_BATTERY = 2
        public static let OTHER = 3
        public static let MAX = 4
        
        public static func isValid(value:Int)->Bool {
        if(value<USER_TRIGGERED||value>=MAX) {
        return false
            
            }
        return true
            
        }
    }
    
    public  class CallRejectReasons {
        
        /**
         * Private Constructor
         */
//        private CallRejectReasons() {
//        throw new IllegalStateException("CallRejectReasons is a Utility class");
//        }
        
        public static let USER_REJECTED = 0
        public static let MAX = 1
        public static func isValid(value:Int)->Bool {
        if(value<USER_REJECTED||value>=MAX) {
        return false
        }
        return true
        }
    }
    
    /**
     * Api to process FloorDenyReason toString
     *
     * @param val FloorDenyReason type
     * @return FloorDenyReason string
     */
    private static func processFloorDenyReasonToString(val:Int)->String {
        var ret = "NOT_SPECIFIED"
        if(val == FloorDenyReason.ANOTHER_USER_HAS_PERMISSION) {
            ret = "ANOTHER_USER_HAS_PERMISSION"
        } else if(val == FloorDenyReason.INTERNAL_SERVER_ERROR) {
            ret = "INTERNAL_SERVER_ERROR"
        } else if(val == FloorDenyReason.ONLY_ONE_PARTICIPANT) {
            ret = "ONLY_ONE_PARTICIPANT"
        } else if(val == FloorDenyReason.RETRY_AFTER_TIMER_IS_NOT_EXPIRED) {
            ret = "RETRY_AFTER_TIMER_IS_NOT_EXPIRED"
        } else if(val == FloorDenyReason.RECEIVE_ONLY) {
            ret = "RECEIVE_ONLY"
        } else if(val == FloorDenyReason.NO_RESOURCES) {
            ret = "NO_RESOURCES"
        } else if(val == FloorDenyReason.QUEUE_FULL) {
            ret = "QUEUE_FULL"
        }
        
        return ret
    }
    
    public class FloorDenyReason{
        
        /**
         * Private Constructor
         */
//        private FloorDenyReason() {
//        throw new IllegalStateException("FloorDenyReason is a Utility class");
//        }
        
        public static let NOT_SPECIFIED = 0
        public static let ANOTHER_USER_HAS_PERMISSION = 1
        public static let INTERNAL_SERVER_ERROR = 2
        public static let ONLY_ONE_PARTICIPANT = 3
        public static let RETRY_AFTER_TIMER_IS_NOT_EXPIRED = 4
        public static let RECEIVE_ONLY = 5
        public static let NO_RESOURCES = 6
        public static let QUEUE_FULL = 7
        public static let MAX = 8
        
        public static func isValid(value:Int)->Bool {
        if(value<NOT_SPECIFIED||value>=MAX){
        return false
        }
        return true
        }
        
        public static func toString(val:Int)->String {
            return processFloorDenyReasonToString(val: val)
        }
    }
    
    public  class FloorRevokeReason{
        
        /**
         * Private Constructor
         */
//        private FloorRevokeReason() {
//        throw new IllegalStateException("FloorRevokeReason is a Utility class");
//        }
        
        public static let NOT_SPECIFIED = 0
        public static let ONLY_ONE_MCPTT_CLIENT = 1
        public static let MEDIA_BURST_TOO_LONG = 2
        public static let NO_PERMISSION_TO_SEND = 3
        public static let PRE_EMPTED = 4
        public static let NOT_SPECIFIED_5 = 5 // NOT definded in TS24.380
        public static let NO_RESOURCES = 6
        public static let MAX = 7
        
        /**
         * Api to process FloorRevokeReason toString
         *
         * @param val FloorRevokeReason type
         * @return FloorRevokeReason string
         */
        private static func processFloorRevokeReasonToString(val:Int)->String {
            var ret = "NOT_SPECIFIED"
            if(val == FloorRevokeReason.ONLY_ONE_MCPTT_CLIENT) {
                ret = "ANOTHER_USER_HAS_PERMISSION"
            } else if(val == FloorRevokeReason.MEDIA_BURST_TOO_LONG) {
                ret = "INTERNAL_SERVER_ERROR"
            } else if(val == FloorRevokeReason.NO_PERMISSION_TO_SEND) {
                ret = "ONLY_ONE_PARTICIPANT"
            } else if(val == FloorRevokeReason.PRE_EMPTED) {
                ret = "RETRY_AFTER_TIMER_IS_NOT_EXPIRED"
            } else if(val == FloorRevokeReason.NO_RESOURCES) {
                ret = "NO_RESOURCES"
            }
            
            return ret
        }
        
        public static func isValid(value:Int)->Bool {
        if(value<NOT_SPECIFIED||value>=MAX) {
        return false
        }
        return true
        }
        public static func toString(val:Int)->String {
            return self.processFloorRevokeReasonToString(val: val)
        }
    }
    
    /**
     * Represent possible states of FT progression.
     */
    public  class FtProgressStatus {
        
        /**
         * Private Constructor
         */
//        private FtProgressStatus() {
//        throw new IllegalStateException("FtProgressStatus is a Utility class");
//        }
        
        /**
         * File is transferring
         */
        public static let TRANSFERRING = 0
        
        /**
         * File transfer is interrupted
         */
        public static let INTERRUPTED = 1
        
        /**
         * File transfer is cancelled
         */
        public static let CANCELLED = 2
        
        /**
         * File transfer is completed
         */
        public static let COMPLETED = 3
        
        public static let MAX = 4
        
        public static func isValid(value:Int)->Bool{
        if(value<TRANSFERRING||value>=MAX) {
        return false
        }
        return true
        }
    }
    
    public class FtErrorReason{
        
        /**
         * Private Constructor
         */
        private func FtErrorReason() {
        //throw new IllegalStateException("FtErrorReason is a Utility class");
        }
        
        public static let NONE = 0
        public static let REMOTE_PARTY_NOT_AVAILABLE = 1
        public static let FILE_IO_ERROR = 2
        public static let TIMEOUT = 3
        public static let NETWORK_ERROR = 4
        public static let INTERNAL_ERROR = 5
        public static let REMOTE_PARTY_NO_RESPONSE = 6
        public static let REMOTE_PARTY_CANCELED = 7
        public static let MAX_SIZE_EXCEEDED = 8
        public static let OTHERS = 9
        public static let MAX = 10
        
        public static func isValid(value:Int)->Bool {
        if(value<NONE||value>=MAX) {
        return false
        }
        return true
        }
        public static func toString(val:Int)->String{
            return processFtErrorReasonToString(val: val)
        }
    }
    
    /**
     * Api to process FtErrorReason toString
     * @param val FtErrorReason value
     * @return FtErrorReason string
     */
    private static  func processFtErrorReasonToString(val:Int)->String {
    var ret = "NOT_SPECIFIED"
    if(val == FtErrorReason.REMOTE_PARTY_NOT_AVAILABLE) {
    ret = "REMOTE_PARTY_NOT_AVAILABLE"
    } else if(val == FtErrorReason.FILE_IO_ERROR) {
    ret = "FILE_IO_ERROR"
    } else if(val == FtErrorReason.TIMEOUT) {
    ret = "TIMEOUT"
    } else if(val == FtErrorReason.NETWORK_ERROR) {
    ret = "NETWORK_ERROR"
    } else if(val == FtErrorReason.INTERNAL_ERROR) {
    ret = "INTERNAL_ERROR"
    } else if(val == FtErrorReason.REMOTE_PARTY_NO_RESPONSE) {
    ret = "REMOTE_PARTY_NO_RESPONSE"
    } else if(val == FtErrorReason.REMOTE_PARTY_CANCELED) {
    ret = "REMOTE_PARTY_CANCELED"
    } else if(val == FtErrorReason.MAX_SIZE_EXCEEDED) {
    ret = "MAX_SIZE_EXCEEDED"
    } else if(val == FtErrorReason.OTHERS) {
    ret = "OTHER_ERRORS"
    }
    
    return ret
    }
    
    /**
     * Represents the type of Message
     */
    public  class MessageType {
        
        /**
         * Private Constructor
         */
//        private MessageType() {
//        throw new IllegalStateException("MessageType is a Utility class");
//        }
        
        /**
         * Constant represents Short Message Type
         */
        public static let SHORT_MSG = 0
        
        /**
         * Constant represents BroadCast/Urgent Message Type
         */
        public static let URGENT_MSG = 1
    }
    
    public  class CmcDocumentType{
        
        /**
         * Private Constructor
         */
//        private CmcDocumentType() {
//        throw new IllegalStateException("CmcDocumentType is a Utility class");
//        }
        
        /**
         * Represents user profile document notification
         */
        public static let USER_PROFILE = 1
        
        /**
         * Represents ue config document notification
         */
        public static let UE_CONFIG = 2
        
        /**
         * Represents Service config document notification
         */
        public static let SERVICE_CONFIG = 3
        
        /**
         * Represents initial ue config document notification
         */
        public static let INITIAL_UE_CONFIG = 4
        
        /**
         * Represents KMC document notification
         */
        public static let KMC = 5
    }
    
    public  class ModifyCallPriority {
        
        /**
         * Private Constructor
         */
//        private ModifyCallPriority() {
//        throw new IllegalStateException("ModifyCallPriority is a Utility class");
//        }
        
        /**
         * Represents call type to be modified as Emergency
         */
        public static let EMERGENCY_IND = 1
        
        /**
         * Represents call type to be modified as Emergency with Alert
         */
        public static let EMERGENCY_IND_WITH_ALERT = 2
        
        /**
         * Represents call type to be modified as Peril
         */
        public static let IMMINENT_PERIL_IND = 3
    }
    
    /**
     * Represents status of fetchParticipantInfo request
     */
    
    public  class FetchParticipantStatus {
        
        /**
         * Private Constructor
         */
//        private FetchParticipantStatus() {
//        throw new IllegalStateException("FetchParticipantStatus is a Utility class");
//        }
        
        /**
         * Represents User request to participants information successful.
         */
        public static let FETCH_PARTICIPANT_STATUS_SUCCESS = 0
        
        /**
         * Represents User request to participants information successful failed
         */
        public static let FETCH_PARTICIPANT_STATUS_FAIL = 1
        
        /**
         *  Represents User subscription to participant information is over, and app need to trigger fetch participant again to get updated member list
         *
         */
        
        public static let FETCH_PARTICIPANT_STATUS_TERMINATED = 2
        
        /**
         * Represents User subscription to participant information is ignored because already subscription is ongoing.
         */
        public static let FETCH_PARTICIPANT_STATUS_IGNORED = 3
    }
    
    /**
     * Represents type of the notification received
     */
    
    public  class FetchParticipantsNotiState {
        
        /**
         * Private Constructor
         */
//        private FetchParticipantsNotiState() {
//        throw new IllegalStateException("FetchParticipantsNotiState is a Utility class");
//        }
        
        /**
         * Represents full notification has been received all previous data to be overwritten by new data
         */
        public static let PTT_NOTI_STATE_FULL = 0
        
        /**
         * Represents deleted list received. the received data needs to be deleted from stored data
         */
        public static let PTT_NOTI_STATE_DELETED = 1
        
        /**
         * Represents partial data received. data needs to be modified if present else add in the already present data.
         */
        public static let PTT_NOTI_STATE_PARTIAL = 2
    }
    
    /**
     * Represents the type of Alert Message
     */
    public  class AlertMessageType {
        
        /**
         * Private Constructor
         */
//        private AlertMessageType() {
//        throw new IllegalStateException("AlertMessageType is a Utility class");
//        }
        
        /**
         * Represents message type to be Normal
         */
        public static let NORMAL = 0
        
        /**
         * Represents message type to be Alert
         */
        public static let ALERT = 1
        
        /**
         * Represents message type to be Emergency
         */
        public static let EMERGENCY = 2
        
        /**
         * Represents message type to be Emergency with Alert
         */
        public static let EMERGENCY_WITH_ALERT = 3
    }
    
    /**
     * Represents the type of Emergency Alert
     */
    public  class EmergencyAlertType {
        
        /**
         * Private Constructor
         */
//        private EmergencyAlertType() {
//        throw new IllegalStateException("EmergencyAlertType is a Utility class");
//        }
        
        /**
         * Represents type to be Alert
         */
        public static let ALERT_IND = 0
        
        /**
         * Represents type to be Emergency
         */
        public static let EMERGENCY_IND = 1
        
        /**
         * Represents type to be Emergency with Alert
         */
        public static let EMERGENCY_WITH_ALERT_IND = 2
    }
    
    /**
     * Represents the type of Priority Call State
     */
    public  class PriorityCallState {
        
        /**
         * Private Constructor
         */
//        private PriorityCallState() {
//        throw new IllegalStateException("PriorityCallState is a Utility class");
//        }
        
        /**
         * Represents type to be Priority Call Capable
         */
        public static let PRIORITY_CALL_CAPABLE = 1
        
        /**
         * Represents type to be Priority Call Requested
         */
        public static let PRIORITY_CALL_REQUESTED = 2
        
        /**
         * Represents type to be Priority Call Granted
         */
        public static let PRIORITY_CALL_GRANTED = 3
    }
    
    /**
     * Represents recording state
     */
    public  class RecordingState {
        
        /**
         * Private Constructor
         */
//        private RecordingState() {
//        throw new IllegalStateException("RecordingState is a Utility class");
//        }
        
        public static let DISABLE = 0
        /**
         * When recording is enabled in Floor_idle state
         */
        public static let ENABLE = 1
        /**
         * When recording is enabled in Floor_taken/ floor_granted state
         */
        public static let START_SUCCESS = 2
        /**
         * When start recording request fails.
         */
        public static let START_FAIL = 3
        /**
         * When recording disabled.
         */
        public static let STOP_SUCCESS = 4
        /**
         * When stop recording fails.
         */
        public static let STOP_FAIL = 5
        
    }
    
    public  class PttWarningCode {
        
        /**
         * Private Constructor
         */
//        private PttWarningCode() {
//        throw new IllegalStateException("PttWarningCode is a Utility class");
//        }
        
        public static let NONE = 0
        public static let ALREADY_HAVE_HALF_DUPLEX_VOICE_CALL = 900
        public static let ALREADY_HAVE_HALF_DUPLEX_VIDEO_CALL = 901
        public static let ALREADY_HAVE_FULL_DUPLEX_VOICE_CALL = 910
        public static let ALREADY_HAVE_FULL_DUPLEX_VIDEO_CALL = 911
    }
    
    /**
     * Represents type of GMS Group ids fetched
     */
    public  class GmsFetchType {
        
        /**
         * Private Constructor
         */
//        private GmsFetchType() {
//        throw new IllegalStateException("GmsFetchType is a Utility class");
//        }
        
        /**
         * The constant ALL.
         */
        public static let ALL = 0
        /**
         * The constant PARTIAL.
         */
        public static let PARTIAL = 1
        
        public static let MAX = 2
        
        public static func isValid(value:Int)->Bool{
        if(value<ALL||value>=MAX){
        return false
        }
        return true
        }
    }
    
    public  class KmcKeyManagementType {
        
        /**
         * Private Constructor
         */
//        private KmcKeyManagementType() {
//        throw new IllegalStateException("KmcKeyManagementType is a Utility class");
//        }
        
        public static let DEFAULT = 0
        
        public static let GMK = 1
        
        public static let CSK = 2
        
        public static let MKFC = 3
    }
    
    /**
     * Represents type of Affiliation of a group
     */
    public  class AffiliationStatusType {
        /**
         * Status is deaffiliated
         */
        public static let DEAFFILIATED = 0
        
        /**
         * Status is affiliated
         */
        public static let AFFILIATED = 1
        
        /**
         * Status is affiliating
         */
        public static let AFFILIATING = 2
    }
}
