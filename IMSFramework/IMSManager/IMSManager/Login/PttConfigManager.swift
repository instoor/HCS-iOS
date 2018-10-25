//
//  PttConfigManager.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class PttConfigManager {
    
}

extension PttConfigManager: IPttConfigSvcIntf {
   
    func onRegistered(regiInfo: ImsRegistration) {
        
    }
 
    func onDeRegister() {
        
    }
    
    func getKmcConfigParamData(profile: ImsProfile, mcPttId: String, userName: String, password: String, pttSettings: PttSettings ) -> KmcConfigParamData {
        return KmcConfigParamData()
    }
    
    func getKmsResponseParamData() -> KmsResponseParamData {
        return KmsResponseParamData()
    }
    
    func getKmsCertificateParamData() -> KmsCertificateParamData {
        return KmsCertificateParamData()
    }
    
    func  getKmsKeySetParamData() -> KmsKeySetParamData {
        return KmsKeySetParamData()
    }
    
    func fetchCmcDocs(mcPttId: String, imsProfile: ImsProfile ) {
        
    }
    
    func onGroupFetchCompleted() {
        
    }
    
    func gmsFetchComplete(fetchType: Int, groupIds: [String]) -> PttReturnValue {
        return PttReturnValue.SUCCESS
    }
    
    func storeKmcDecodedKey(kmcDecodedKeys: [KmcDecodedKey]) -> [GroupStatus] {
        return [GroupStatus]()
    }
    
    func getGroupEncryptionKey(groupUri: String) -> [GroupEncryptionKeyParam] {
        return [GroupEncryptionKeyParam]()
    }
   
    func updateNetworkInterface(nwkInterface: String) {
        
    }
}
