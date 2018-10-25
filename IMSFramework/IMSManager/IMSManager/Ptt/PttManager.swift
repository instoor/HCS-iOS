//
//  PttManager.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

  public class PttManager {
    
    public static let shared = PttManager()
    private var mCommonService: PttCommonServiceModule?
    //Applications can turn on ptt service using this API
    //If applications doesn't need PTT functionality it need to call PttManager.shared.turnOffPttService
    public func turnOnPttService() -> PttReturnValue {
        return PttReturnValue.SUCCESS
    }
    // This is to turn off ptt service whenever it is not needed
    public func turnOffPttService() -> PttReturnValue {
        return PttReturnValue.SUCCESS
    }
    //Specify operating service either on-network or off-network
    public func switchServiceMode(serviceMode: Int) -> PttReturnValue {
        return PttReturnValue.SUCCESS
    }
    //Get current operating service mode either on-network or off-network
    public func getServiceMode () -> Int {
        return 0
    }
    //This api is for application to know the current state of its login
    public func getLoginState() -> PttLoginState {
        return PttLoginState.LOGGED_IN
    }

    //Application can fetches id for the login. on which id login is happened, -1 if there is no current login
    public func getId () -> Int {
        return -1
    }
    //Application can trigger login with this api. application need to check login state
    //{ PttManager.shared.getLoginState()} before this call.//
    public func login(type: Int, userName: String, password: String) -> Int? {
        //To do: need to identify the appName parameter & trim of username
        if let mCommonService = mCommonService {
            return mCommonService.login(appName: "appname", type: type, userName: userName.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines), password: password.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines))
        }
        return -1
    }
    //Application can trigger logout using this api. id login id which was given at the time of login
    public func logout(loginId: Int) -> PttReturnValue {
        return PttReturnValue.IMS_NOT_READY
    }

    ////Fetch the current stored access token, This api don't trigger IDMC procedure
    public func getAccessToken() -> PttAccessToken? {
        if let mCommonService = mCommonService {
            return mCommonService.getAccessToken()
        }
        return nil
    }
    public func sendMsg(chatID: Int, pttImData:PttImData) throws -> Any {
        let test:Bool = true
        if(test){
            return PttImInfo()
        }else{
            return IMSLibraryError.error1
        }
    }
}
