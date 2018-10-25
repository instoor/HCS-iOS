//
//  IdmcStorage.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class IdmcStorage {
    
    private var mAccessToken: String?        /**IDMC access token. Access token coontains MC Service ID*/
    private var mRefreshToken: String?       /**refresh token used to fetch access token without requiring user login again*/
    private var mIdToken: String?           /**Contains the MC Service ID of the user. Also contains other user info*/
    private var mMcpttId: String?            /**MCPTT Service ID of the user*/
    private var mExpiryTime: UInt64?          /**Expiry time of the idmc access token*/
    private var mBearerType: String?         /**Bearer type*/
    private var mUserName: String?          /**User name used for idmc login*/
    private var mPassword: String?
    
    public func getAccessToken() -> String? {
        return mAccessToken
    }
    public func getMcpttId() -> String? {
       return mMcpttId
    }
    public func getExpiryTime() -> UInt64? {
        return mExpiryTime
    }
    
    /**
     * @brief Api to update/modify the IDMC parameters.
     * @param userName: Login user name
     * @param password: Login password.
     * @param accessToken: access token received from IdMS.
     * @param refreshToken: refresh token received from IdMS.
     * @param idToken: id token received from IdMS.
     * @param mcpttId: MCPTT ID corresponding to the login user.
     * @param expiryTime: access token  expiry time.
     * @param bearerType: Bearer type used for IDMS.
     * @return true if successfully stored to the storage.
     * */
    public func updateValues(usercredential: [String: String], tokenDetail: [String: String], mcpttId: String, expiryTime: UInt64, bearerType: String) -> Bool {
    mUserName = usercredential["userName"]
    mPassword = usercredential["password"]
    mAccessToken = tokenDetail["accessToken"]
    mRefreshToken = tokenDetail["refreshToken"]
    mIdToken = tokenDetail["idToken"]
    mExpiryTime = expiryTime
    mBearerType = bearerType
    mMcpttId = mcpttId
//    SharedPreferences storage= mContext.getSharedPreferences(PREFERENCE_NAME, Context.MODE_PRIVATE)
//    SharedPreferences.Editor editor = storage.edit()
//    editor.putString(ACCESS_TOKEN_KEY,accessToken)
//    editor.putString(REFRESH_TOKEN_KEY, refreshToken)
//    editor.putString(ID_TOKEN_KEY, idToken)
//    editor.putString(MCPTT_ID, mcpttId)
//    editor.putLong(EXPIRY_VALUE_KEY, expiryTime)
//    editor.putString(BEARER_TYPE_KEY, bearerType)
//    editor.putString(USER_NAME, userName)
//    editor.putString(PASSWORD, password)
    //return editor.commit();
        return true
    }
    
    /**
     * @brief Api to update/modify the IDMC parameters.
     * @param accessToken: access token received from IdMS.
     * @param refreshToken: refresh token received from IdMS.
     * @param expiryTime: access token  expiry time.
     * @param bearerType: Bearer type used for IDMS.
     * @return true if successfully stored to the storage.
     * */
    public func updateValues(accessToken: String, refreshToken: String, mcpttId: String, expiryTime: UInt64, bearerType: String) -> Bool {
    mAccessToken = accessToken
    mRefreshToken = refreshToken
    mExpiryTime = expiryTime
    mBearerType = bearerType
//    SharedPreferences storage= mContext.getSharedPreferences(PREFERENCE_NAME, Context.MODE_PRIVATE);
//    SharedPreferences.Editor editor = storage.edit();
//    editor.putString(ACCESS_TOKEN_KEY,accessToken);
//    editor.putString(REFRESH_TOKEN_KEY, refreshToken);
//    editor.putLong(EXPIRY_VALUE_KEY, expiryTime);
//    editor.putString(BEARER_TYPE_KEY, bearerType);
//    return editor.commit();
        return true
    }

}
