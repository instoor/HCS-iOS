//
//  PttLoginSession.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class PttLoginSession {
    
    private var mImsRegistration: ImsRegistration?
    private var mUserName: String
    private var mPassword: String
    private var mProfile: ImsProfile
    private var mState: PttLoginState
    private var mReason: PttLoginReason
    private var mReasonText: PttLoginReason
    private var mServiceType: Int
    private var mAppName: String
    private var mPttSettings: PttSettings
    private var mIsFreshRegister = true
    private var mLoginManager: PttLoginManager
    private var mPendingIdms = false
    private var mPdnConnected = false

     init(manager: PttLoginManager, profile: ImsProfile, userName: String, password: String, serviceType: Int, appName: String, pttSettings: PttSettings) {
    mLoginManager = manager
    mUserName = userName
    mPassword = password
    mProfile = profile
    mState = PttLoginState.LOGGED_OUT
    mReason = PttLoginReason.NORMAL
    mServiceType = serviceType
    mAppName = appName
    mPttSettings = pttSettings
    mReasonText = PttLoginReason.NORMAL
    mPendingIdms = false
    }
    
    public func getProfile() -> ImsProfile? {
        return mProfile
    }

    public func getPassword() -> String? {
      return mPassword;    }
    
    public func getUserName() -> String? {
       return mUserName
    }
    public  func getPttSettings() -> PttSettings {
    return mPttSettings
    }
}

extension PttLoginSession: PdnEventListener {
    
    func onConnected(networkType: Int) {
        mLoginManager.onPdnConnected(session: self)
    }
}
