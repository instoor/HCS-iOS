//
//  PttLoginManager.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class PttLoginManager {
    
    private var mLogins = [Int: PttLoginSession]()
    private var mPttConfigSvcIntf: IPttConfigSvcIntf?
    
    public func login(appName: String, userName: String, password: String, serviceType: Int) -> Int? {
        
//        String operator = ImsServiceStub.getInstance().getSimManager().getSimOperator(mContext);
//        if (operator.isEmpty()) {
//            Log.d(LOG_TAG, "operator is empty No login possible");
//            //TODO This case happens? If happens do we need to defer this request?
//            return -1;
//        }

        let session = getLogin(userName: userName, password: password)
        //return session?.getProfile()?.getId()
        
        ImsServiceStub.getInstance()?.getPdnController(delegate: session)?.startPdnConnectivity(networkType: 0, phoneId: 0)
        return session?.getProfile()?.getId()
    }
    
    private func getLogin(userName: String, password: String ) -> PttLoginSession? {
        
        var session: PttLoginSession?
        
        for loginSession in mLogins.values {
            if loginSession.getUserName() == userName && loginSession.getPassword() == password {
                session = loginSession
                break
            }
        }
        return session
    }
    //public func onPdnConnected(session: PttLoginSession , Network network)
    public func onPdnConnected(session: PttLoginSession) {
    
        //CSCRouteManager.setNetwork(network);
        //mPttConfigSvcIntf?.updateNetworkInterface(nwkInterface: ImsServiceStub.getInstance()?.getPdnController()?.getInterfaceName(listener: session))
        handlePdnConnectedForSession(session: session)
        
    }
    private func handlePdnConnectedForSession(session: PttLoginSession) {

   // IdmcManager.getInstance(mContext).updateNetwork(session.getPttSettings().getPdnType())
        
//    if (session.isPendingIdms()) {
        
        IdmcManager.getInstance().fetchAccessToken(userName: session.getUserName(), password: session.getPassword(), delegate: self, settings: session.getPttSettings())
        
//    session.setPendingIdms(false);
//     }
    }
}

extension PttLoginManager: IdmcResponseCallback {
    
    func onTokenFetchCompleted(accessToken: String, mcpttId: String) {
        
    }
    func onTokenFetchFailed(error: String, errorReason: String) {
        
    }
    
    func onTokenRefreshed(newAccessToken: String) {
        
    }
    
    func onTokenRefreshFailed(error: String, errorReason: String) {
        
    }
}
