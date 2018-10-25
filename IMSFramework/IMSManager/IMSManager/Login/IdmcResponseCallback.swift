//
//  IdmcResponseCallback.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

protocol IdmcResponseCallback: AnyObject {
    
    /**
     * Api to indicate Idms token fetch is completed
     *
     * @param accessToken idms access token
     * @param mcpttId     mcptt id
     */
     func onTokenFetchCompleted(accessToken: String, mcpttId: String)
    
    /**
     * Api to indicate Idms token fetch failed
     *
     * @param error        Error info
     * @param errorReason  Reason info
     */
     func onTokenFetchFailed(error: String, errorReason: String)
    
    /**
     * Api to indicate Idms token is refreshed
     *
     * @param newAccessToken  new access token value
     */
     func onTokenRefreshed(newAccessToken: String)
    
    /**
     * Api to indicate Idms token refresh failed
     *
     * @param error        Error info
     * @param errorReason  Reason info
     */
    func onTokenRefreshFailed(error: String, errorReason: String)
}
