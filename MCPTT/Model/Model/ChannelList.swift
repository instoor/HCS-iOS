//
//  ChannelList.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class ChannelList {
    
    private var channels: Set<Channel1>
    let queue = DispatchQueue(label: "ChannelListQueue")

    init() {
        self.channels = Set<Channel1>()
    }
    
    func count() -> Int {
        return self.channels.count
    }
    
    func getList() -> Array<Channel1> {
        var channeldList: Array<Channel1> = []
        queue.sync {
            channeldList = channels.sorted(by: >)
        }
        return channeldList
    }
    
    func getFirst() -> Channel1? {
        return channels.isEmpty ? channels.first : nil
    }
    
    func push(channel: Channel1) {
        queue.sync {
           _ = self.channels.insert(channel)
        }
    }
    
    func pop(channel: Channel1) -> Bool {
        var removedChannel: Channel1?
        queue.sync {
            removedChannel = channels.remove(channel)
        }
        if removedChannel == channel {
            return true
        }
        return false
    }
    
    func getActiveChannelCount() -> Int {
        var activeChannelCount = 0
        queue.sync {
            activeChannelCount = channels.filter { channel in
                return channel.isActiveChannel
            }.count
        }
        return activeChannelCount
    }
    
    func getChannel(by sessionId: Int32) -> Channel1? {
        var channel: Channel1?
        queue.sync {
            channel = channels.first(where: { $0.sessionId == sessionId })
        }
        return channel
    }
    
    func getChannel(by pttUrl: PttUrl) -> Channel1? {
        var channel: Channel1?
        queue.sync {
            channel = channels.first(where: { $0.pttUrl.isEqual(url: pttUrl) })
        }
        return channel
    }
    
    func clear() {
        queue.sync {
            channels.removeAll()
        }
    }
    
    func getHomeChannel() -> Channel1? {
        var channel: Channel1?
        queue.sync {
            channel = channels.first(where: { $0.isHomeType })
        }
        return channel
    }
    
    func getMainChannel() -> Channel1? {
        var channel: Channel1?
        queue.sync {
            channel = channels.first(where: { $0.channeltype == ChannelType.main })
        }
        return channel
    }
    
    func getEmergencyChannel() -> Channel1? {
        var channel: Channel1?
        queue.sync {
            guard let channelObject = channels.first(where: { $0.isEmergencyCallPriority }) else {
               // If there is no emergency channel, return Top priority channel
                channel = getFirst()
                return
            }
            channel = channelObject
        }
        return channel
    }
    
    func setChannelType(for channel: Channel1, channelType: ChannelType) -> Bool {
        if pop(channel: channel) {
            channel.channeltype = channelType
            push(channel: channel)
            return true
        }
        return false
    }
    
//    func pullPreArrangedGroup() {
//
//    }
}
