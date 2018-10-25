//
//  IPttConfigSvcIntf.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

 protocol IPttConfigSvcIntf {
    
    /**
     * Api to indicated device is registered
     *
     * @param regiInfo ImsRegistration info
     */
      func onRegistered(regiInfo: ImsRegistration)
    
    /**
     * Api to indicate device is de registered
     */
      func onDeRegister()
    
    /**
     * Api to get Kmc Config Data
     *
     * @param profile       imsprofile info
     * @param mcPttId       mcpttid
     * @param userName      username of the login session
     * @param password      password of the login session
     * @param pttSettings   PttSettings data
     * @return Kmc Config data
     */
      func getKmcConfigParamData(profile: ImsProfile, mcPttId: String, userName: String, password: String, pttSettings: PttSettings ) -> KmcConfigParamData
    
    /**
     * Api to get Kmc Response Data
     *
     * @return Kmc Response data
     */
     func getKmsResponseParamData() -> KmsResponseParamData

    /**
     * Api to get Kmc Certificate data
     *
     * @return Kmc Certificate data
     */
    func getKmsCertificateParamData() -> KmsCertificateParamData
    
    /**
     * Api to get Kmc Keyset data
     *
     * @return Kmc Keyset data
     */
    func  getKmsKeySetParamData() -> KmsKeySetParamData
    
    /**
     * Api to fetch Cmc doc
     *
     * @param mcPttId     mcptt id
     * @param imsProfile  imsprofile info
     */
    func fetchCmcDocs(mcPttId: String, imsProfile: ImsProfile )
    
    /**
     * Api to indicate from App that group fetch is completed
     */
     func onGroupFetchCompleted()
    
    /**
     * Api to indicate from app that gmc fetch is completed and start fetch gms info from App database
     *
     * @param fetchType  type of fetch needed to do
     * @param groupIds   group id
     * @return PttReturn value
     */
    func gmsFetchComplete(fetchType: Int, groupIds: [String]) -> PttReturnValue
    
    /**
     * Api to store kmc decoded key from Ims Stack
     *
     * @param kmcDecodedKeys list of kmc decoded keys
     * @return list of group status info
     */
    func storeKmcDecodedKey(kmcDecodedKeys: [KmcDecodedKey]) -> [GroupStatus]
    
    /**
     * Api to get group encryption key based on group uri
     *
     * @param groupUri  group uri details
     * @return list of group encryption key values
     */
    func getGroupEncryptionKey(groupUri: String) -> [GroupEncryptionKeyParam]
    
    /**
     * Api to update network interface name
     *
     * @param nwkInterface Pdn network interface name
     */
    func updateNetworkInterface(nwkInterface: String)
}
