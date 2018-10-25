//
//  ImsServiceStub.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class ImsServiceStub {

    private static var sInstance: ImsServiceStub?
    private var mPdnController: PdnController?
    public static func getInstance() -> ImsServiceStub? {
        //To do: Need to implement using Extensions
//        while getInstanceInternal == nil {
//            try {
//            if (Extensions.UserHandle.myUserId()
//            != Extensions.ActivityManager.getCurrentUser()) {
//            Log.d(LOG_TAG, "Do not initialize on background user");
//            return null;
//            }
//            } catch (IllegalStateException e) {
//            e.printStackTrace();
//            }
//
//            Log.e(LOG_TAG, "instance is null..."); // TODO
//            try {
//            Thread.sleep(1000);
//            } catch (InterruptedException e) {
//            e.printStackTrace();
//            }
//        }
        return getInstanceInternal()
    }
    
    public func getSimManager() -> SimManager {
        //To do: need to implement factory design pattern for SimManager
        return SimManager()
    }
    
    private static func getInstanceInternal() -> ImsServiceStub? {
        //objc_sync_enter(self)
         return sInstance
        //objc_sync_enter(self)
    }
    
    public func getPdnController(delegate: PdnEventListener?) -> PdnController? {
    //mContext.enforceCallingOrSelfPermission(PERMISSION, LOG_TAG);
    mPdnController = PdnController() // Need to initialize in initializer
    mPdnController?.delegate = delegate
    return mPdnController
    }
}
