//
//  PttCommonServiceModule.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class PttCommonServiceModule {
    
    private var mPttLoginManager: PttLoginManager?
    
    public func login(appName: String, type: Int, userName: String, password: String) -> Int? {
        
        if appName.isEmpty || userName.isEmpty || password.isEmpty {
            return -1
        }
          return mPttLoginManager?.login(appName: appName, userName: userName, password: password, serviceType: type)
    }

    public func getAccessToken() -> PttAccessToken? {
       return IdmcManager.getInstance().fetchTokenDetails()
    }
}
