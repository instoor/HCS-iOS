//
//  FloorSession.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
//import PT

class FloorSession {
    static let invalidId: Int32 = 0
    var mId: Int64 = 0
    var mFloorConnectTime: Int64 = 0
    var mFloorDisconnectTime: Int64 = 0
    var mStopTalkingTimer: Int64 = 0
    var mFloorState: FloorState = .idle
    var mPracticalFloorState: FloorState = .idle
    var mFloorRejectCode: Int64 = 0
    var mQueuePosition: Int64 = 0
    var mFloorRevokeCode: Int64 = 0
    //var mPerrUri: PTTU
    
    init(id: Int64) {
        mId = id
    }
    
    func setMFloorConnectTime() {
        mFloorConnectTime = Date().toMilisecond()
    }
    
    func setMFloorDisconnectTime() {
        mFloorDisconnectTime = Date().toMilisecond()
    }
    
    func setMStopTalkingTimer(stopTalkingTimer: Int64) {
        mStopTalkingTimer = stopTalkingTimer * 1000
    }
    
    func setFloorFor(state: FloorState) {
        mFloorState = state
        setPractical(floorState: state)
    }
    
    private func setPractical(floorState: FloorState) {
        if (floorState == .idle || floorState == .granted || floorState == .taken) {
            mPracticalFloorState = floorState
        }
    }
}
