//
//  ChannelModel.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

protocol ChannelListenerDelegate: AnyObject {
    func onChannelListChanged()
    func onChannelTypeUpdated(for channel: Channel1)
    func onSessionStateChanged(for channel: Channel1)
    func onModifyCallStateChanged(for channel: Channel1)
    func onModifyPriorityCallStateChanged(for channel: Channel1)
    func onMakeCallResult(for channel: Channel1)
    func onMessageReceived()
    func onFetchParticipantListStatus(for channel: Channel1)
    // TODO: Will uncomment once ParticipantInfo will implement
    //func onParticipantsInfo(for info: [ParticipantInfo])
}

class ChannelModel {
    
    private static let tag: String = "ChannelModelImpl"
    
    enum EventType: Int {
        case channelListChanged = 0
        case channelTypeChanged = 1
        case sessionStateChanged = 2
        case modifyCallStateChanged = 3
        case modifyPriorityCallStateChanged = 4
        case makeCallResult = 5
        case messageReceived = 6
        case fetchParticipantListStatus = 7
        case participantsInfo = 8
    }
    // Need to discuss with Sujit
   // private static WeakReference<ChannelModelImpl> mWeakReference;

    private var channelList: ChannelList
    private var prevMainChannel: Channel1?
    
    weak var delegate: ChannelListenerDelegate?
    
    init() {
        channelList = ChannelList()
    }
    
    func handleEventType(for eventType: EventType, channel: Channel1?) {
        switch eventType {
        case .channelListChanged:
            delegate?.onChannelListChanged()
        case .channelTypeChanged:
            guard let channel = channel else {
                return
            }
            delegate?.onChannelTypeUpdated(for: channel)
        case .sessionStateChanged:
            guard let channel = channel else {
                return
            }
            delegate?.onSessionStateChanged(for: channel)
        case .modifyCallStateChanged:
            guard let channel = channel else {
                return
            }
            delegate?.onModifyCallStateChanged(for: channel)
        case .modifyPriorityCallStateChanged:
            guard let channel = channel else {
                return
            }
            delegate?.onModifyPriorityCallStateChanged(for: channel)
        case .makeCallResult:
            guard let channel = channel else {
                return
            }
            delegate?.onMakeCallResult(for: channel)
        case .messageReceived:
            delegate?.onMessageReceived()
        case .fetchParticipantListStatus:
            guard let channel = channel else {
                return
            }
            delegate?.onFetchParticipantListStatus(for: channel)
        case .participantsInfo:
            return
            //TODO: Handle participants info case here
           // delegate?.
        }
    }
    
    func getChannel(for pttUrl: PttUrl) -> Channel1 {
        let channelObject = channelList.getChannel(by: pttUrl)
        guard let channel = channelObject else {
            // if Channel not found create new channel and send Channel list changed event
            let channel = createChannel(for: pttUrl)
            handleEventType(for: .channelListChanged, channel: channel)
            return channel
        }
        return channel
    }
    
    func getChannelList() -> [Channel1] {
        return channelList.getList()
    }
    
    func getMainChannel() -> Channel1? {
        return channelList.getMainChannel()
    }
    
    func getEmergencyChannel() -> Channel1? {
        return channelList.getEmergencyChannel()
    }
    
    func remove(channel: Channel1) {
        if channelList.pop(channel: channel) {
            handleEventType(for: .channelListChanged, channel: channel)
        }
    }
    
    func activate(channel: Channel1) {
        if channel.isActiveChannel {
           setChannelAsMain(channel: channel)
        } else {
            
        }
    }
    
    func setChannelType(channel: Channel1, channelType: ChannelType) {
       _ = channelList.setChannelType(for: channel, channelType: channelType)
        handleEventType(for: .channelTypeChanged, channel: channel)
    }
    
    func deactivate(channel: Channel1, reason: CallEndReason) {
        if !channel.isActiveChannel {
            return
        }
        // TODO:
    }
    
    func setMainChannel(channel: Channel1) {
        activate(channel: channel)
    }
    
    func getCandidateMainChannel() -> Channel1? {
        var newMainChannel = channelList.getHomeChannel()
        
        if newMainChannel == nil {
            newMainChannel = prevMainChannel
        }
        
        if newMainChannel == nil {
            newMainChannel = channelList.getFirst()
        }
        
        if newMainChannel != nil && newMainChannel?.channeltype == .main {
            newMainChannel = nil
        }
        return newMainChannel
    }
    
    func leave(channel: Channel1) {
        if channel.channeltype == .dormant {
            return
        }
        
        if channel.isActiveChannel {
            // TODO: call end code will be call here
        }
        
        setChannelType(channel: channel, channelType: .dormant)
    }
    
    func startRecording(for channel: Channel1) {
        // TODO: Need to implement this code
    }
    
    func stopRecording(for channel: Channel1) {
        // TODO: Need to implement this code
    }
    
    func getActiveChannelCOunt() -> Int {
        return channelList.getActiveChannelCount()
    }
    
    func getChannel(by sessionId: Int32) -> Channel1? {
        return channelList.getChannel(by: sessionId)
    }
    
    func onSessionStateChanged(for channel: Channel1) {
        
        if channel.sessionState == .established {
            if channel.callType != .broadcastGroup {
                setChannelAsMain(channel: channel)
            }
        } else if channel == getMainChannel() && !channel.isActiveChannel {
            setChannelType(channel: channel, channelType: .dormant)
        }
        handleEventType(for: .sessionStateChanged, channel: channel)
    }
    
    func onModifyCallStateChanged(channel: Channel1) {
        handleEventType(for: .modifyCallStateChanged, channel: channel)
    }
    
    func onCallPriorityChanged(channel: Channel1) {
        handleEventType(for: .modifyPriorityCallStateChanged, channel: channel)
    }
    
    func onMessageUpdate(pttUrl: PttUrl) {
        guard let channel = channelList.getChannel(by: pttUrl) else {
            return
        }
        _ = channelList.pop(channel: channel)
        channel.updatedTime = Date().toMilisecond()
        channelList.push(channel: channel)
        handleEventType(for: .channelListChanged, channel: channel)
    }
    
    func onGroupInfoUpdate() {
        getGroupChannelFromDB()
    }
    
    func onFetchParticipantListStatus(channel: Channel1, participantStatus: FetchParticipantStatus) {
        let session = channel.session
        session.fetchParticipantStatus = participantStatus
        handleEventType(for: .fetchParticipantListStatus, channel: channel)
    }
    
    func onParticipantsInfo(infos: [PttUrl: ConferenceParticipantState]) {
        // TODO: Implement once ParticipantInfo model ported
    }
    
    func requestFetchParticipantList(for channel: Channel1) {
        // TODO
    }
    
    // TODO: Implement once ParticipantInfo don
//    func getParticipantsInfo(for channel: Channel1) -> [ParticipantInfo] {
//
//    }
    
    func onLoginStateChanged(loginState: LoginState, loginReason: LoginReason) {
        switch loginState {
        case .loggedOut:
            channelList.clear()
        case .loggedIn:
            channelList.clear()
            createChannelFromDB()
        default:
            break
        }
    }
}

private extension ChannelModel {
    func createChannel(for pttUrl: PttUrl) -> Channel1 {
        return createChannel(for: pttUrl, updateTime: Date().toMilisecond())
    }
    
    func createChannel(for pttUrl: PttUrl, updateTime: Int64) -> Channel1 {
        // TODO: Need to implement this method logic once ContactDatBase controller is implemenet
        return Channel1()
    }
    
    func createChannel(for pttUrl: PttUrl, contact: Contact) -> Channel1 {
        return createChannel(for: pttUrl, contact: contact, updateTime: Date().toMilisecond())
    }
    
    func createChannel(for pttUrl: PttUrl, contact: Contact, updateTime: Int64) -> Channel1 {
        // TODO: Need to implement InjectionManager then will implement this
        return Channel1()
    }
    
    func setChannelAsMain(channel: Channel1) {
        if channel.channeltype == .main {
            // Channel is already main channel
            return
        }
        guard let prevMainChannel = channelList.getMainChannel() else {
            setChannelType(channel: channel, channelType: .main)
            return
        }
        setChannelType(channel: prevMainChannel, channelType: .dormant)
        setChannelType(channel: channel, channelType: .main)
    }
    
    func setMainChannel() {
        guard let channel = getCandidateMainChannel() else {
            return
        }
        setChannelAsMain(channel: channel)
    }
    
    func getGroupChannelFromDB() {
        // TODO: implement this method once database classes succesfully ported
    }
    
    func createChannelFromDB() {
        // TODO: implement this method once database classes succesfully ported
    }
    
    // func createParticipantInfo(pttUrl: PttUrl, participantState: State) {
    // TODO: Implement once ParticipantInfo done
    //}
    
    // func createParticipantInfo(pttUrl: PttUrl) {
    // TODO: Implement once ParticipantInfo done
    //}
}
