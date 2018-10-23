//
//  FloorSession.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class FloorSession {
    static let invalidId: Int32 = 0
    var id: Int32 = 0
    var floorConnectTime: Int64 = 0
    var floorDisconnectTime: Int64 = 0
    var stopTalkingTimer: Int64 = 0
    var floorState: FloorState = .idle
    var practicalFloorState: FloorState = .idle
    var floorRejectCode: Int64 = 0
    var queuePosition: Int64 = 0
    var floorRevokeCode: Int64 = 0
    var peerUrl: PttUrl = PttUrl.init(urls: "")
    
    init(id: Int32) {
        self.id = id
    }
    
    func setFloorConnectTime() {
        floorConnectTime = Date().toMilisecond()
    }
    
    func setFloorDisconnectTime() {
        floorDisconnectTime = Date().toMilisecond()
    }
    
    func setStopTalkingTimer(stopTalkingTimer: Int64) {
        self.stopTalkingTimer = stopTalkingTimer * 1000
    }
    
    func setFloorFor(state: FloorState) {
        floorState = state
        setPractical(floorState: state)
    }
    
    private func setPractical(floorState: FloorState) {
        if (floorState == .idle || floorState == .granted || floorState == .taken) {
            practicalFloorState = floorState
        }
    }
}
