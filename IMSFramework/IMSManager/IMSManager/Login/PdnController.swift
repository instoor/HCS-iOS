//
//  PdnController.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

protocol PdnEventListener: AnyObject {
    //func onConnected(networkType: Int ,network:Network );
    func onConnected(networkType: Int)
    
    //    func onDisconnected(networkType: Int , isPdnUp: Bool )
    //
    //    func onSuspended(networkType: Int)
    //
    //    func onLocalIpChanged(networkType: Int)
    //
    //    func onPcscfAddressChanged(networkType: Int, List<String> pcscf);
    //
    //    func onResumed(int networkType);
    //
    //    func onSuspendedBySnapshot(int networkType);
    //
    //    func onResumedBySnapshot(int networkType);
}

class PdnController {
    
    weak var delegate: PdnEventListener?
//    private var mNetworkCallbacks = [PdnEventListener: NetworkCallback]()
    //public func startPdnConnectivity(networkType: Int ,listener: PdnEventListener,phoneId: Int ) -> Int
    public func startPdnConnectivity(networkType: Int, phoneId: Int ) -> Int {
    
//    NetworkInfo ni = mConnectivityManager.getNetworkInfo(networkType);
//
//    if (ni != null && !ni.isAvailable()) {
//    Log.d(LOG_TAG, "startPdnConnectivity: not available");
//    return APN_TYPE_NOT_AVAILABLE;
//    }
//
//    sendMessage(obtainMessage(EVENT_REQUEST_NETWORK, networkType, phoneId, listener));
//
//    return APN_REQUEST_STARTED;
        return 0
    }
    
    public func  getInterfaceName(listener: PdnEventListener) -> String? {
//    synchronized (mNetworkCallbacks) {
//    NetworkCallback callback = mNetworkCallbacks.get(listener);
//    if (callback != null && callback.mLinkProperties != null) {
//    String intfName = callback.mLinkProperties.getInterfaceName();
//    if (intfName != null) {
//    return intfName;
//      }
//     }
//    }
    return nil
    }
}
