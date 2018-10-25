//
//  IdmcManager.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
class IdmcManager {
    
    private static let shared = IdmcManager()
    private var mStorage: IdmcStorage?
    private var mPttSettings: PttSettings?
    weak var delegate: IdmcResponseCallback?
    private var mCodeVerifier: String?
    private var mCodeChallenge: String?
    private var mLastState: String?
    public class func getInstance() -> IdmcManager {
        return shared
    }
    
    public func fetchAccessToken(userName: String?, password: String?, delegate: IdmcResponseCallback, settings: PttSettings) {
//        Preconditions.checkNotNull(settings);
//        Preconditions.checkNotNull(callback);
//        Preconditions.checkNotNull(userName);
        self.delegate = delegate
        let userName = IdmcUtil.formUri(userName: userName)
        let password = IdmcUtil.encode(value: password, method: "ALG_METHOD_SHA_256")
        mPttSettings = settings
        initializer()
        
//        try {
//        checkAndAddRoute();
//
//        boolean isValidtokenExist = validateToken(userName, password);
//        if (!isValidtokenExist) {
//        Log.d(LOG_TAG, "No valid token");
//        Message.obtain(mHandler, IdmcHandler.AUTH_REQUEST,
//        new String[]{userName, password}).sendToTarget();
//        } else {
//        Log.d(LOG_TAG, "Token already exists");
//        mCallback.onTokenFetchCompleted(mStorage.getAccessToken(), mStorage.getMcpttId());
//        }
//        } catch (IOException e) {
//        Log.e(LOG_TAG, "BindProcessToNetwork Failed:", e);
//        postTokenFetchFailed(AuthErrors.INTERNAL_EXCEPTION, INTERNAL_EXCEPTION_REASON);
//        }
        if let userName = userName, let password = password {
            performUserAuthorization(userName: userName, password: password)
        }
        
    }
    
    private func initializer() {
        guard let _ = mStorage else {
//            mStorage = new IdmcStorage(mContext);
//            mHandlerThread.start();
//            mHandler = new IdmcHandler(mHandlerThread.getLooper());
//            mAlarmManager = (AlarmManager) mContext.getSystemService(Context.ALARM_SERVICE);
//            Intent intent = new Intent("com.sec.internal.ims.ptt.ToekenHandler.AlarmBroadCast");
//            IntentFilter filter = new IntentFilter(intent.getAction());
//            mContext.registerReceiver(mReceiver, filter);
//            mPendingIntent = PendingIntent.getBroadcast(mContext, ALARM_FOR_REFRESH, intent,
//                                                        PendingIntent.FLAG_CANCEL_CURRENT);
            mStorage = IdmcStorage()
            return
        }
        
    }
    
    public func performUserAuthorization(userName: String, password: String) {
    //Need to call api for access token and then use HTTPURLResponse for processAuthResponse method
        
        mCodeVerifier = IdmcUtil.getNewCodeVerifier()
        mCodeChallenge = IdmcUtil.encode(value: mCodeVerifier, method: "ALG_METHOD_SHA_256")
        
//        mFlow = new AuthorizationCodeFlow.Builder(
//            BearerToken.authorizationHeaderAccessMethod(),
//            mTransport,
//            mJsonFactory,
//            new GenericUrl(constructUrl(mPttSettings.getIdmsServerIp(), mPttSettings.getIdmsServerPort(),TOKEN_SERVER_EXTENSION, mPttSettings.isTlsEnabled())),
//            null,
//            CLIENT_ID,
//            constructUrl(mPttSettings.getIdmsServerIp(), mPttSettings.getIdmsServerPort(),AUTHORIZATION_SERVER_EXTENSION, mPttSettings.isTlsEnabled()))
//            .setScopes(Arrays.asList(SCOPES))
//            .build();
        
        mLastState = IdmcUtil.getNewState()
//        String authorizationUrl = mFlow.newAuthorizationUrl().setRedirectUri(
//            REDIRECT_URI).setState(mLastState).set(CODE_CHALLENGE,
//                                                   mCodeChallenge).set(CODE_CHALLENGE_METHOD, ALG_METHOD_SHA_256_VALUE).set(
//                                                    ACR_VALUES,
//                                                    "3gpp:acr:password").set(USER_NAME, userName).set(USER_PASSWORD,
//                                                                                                      password).build();
        let authorizationUrl = ""//Need to make url same as android
        
        guard let url = URL(string: authorizationUrl) else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession.init(configuration: config)
        let task = session.dataTask(with: request) { [weak self](data, response, error) in
            if let response = response as? HTTPURLResponse {
                self?.processAuthResponse(response: response, userName: userName, password: password)
            }
        }
        task.resume()
        
    }
    private func processAuthResponse(response: HTTPURLResponse, userName: String, password: String) {
    //Need to identify authCode & cookie
        fetchTokenFromTokenUrl(authCode: "authCode", userName: userName, password: password, cookie: "cookie")
    }
    public func fetchTokenFromTokenUrl(authCode: String, userName: String, password: String,
                                       cookie: String) {
    //Need to implement fetching accesstoke from api
        let usercredential = ["userName": userName, "password": password]
        let tokenDetail = ["accessToken": "accessToken", "refreshToken": "refreshToken", "idToken": "idToken"]
        mStorage?.updateValues(usercredential: usercredential, tokenDetail: tokenDetail, mcpttId: "mcppttid", expiryTime: 23, bearerType: "type")
        delegate?.onTokenFetchCompleted(accessToken: "accesstoken", mcpttId: "mcpttid")
    }
    
    public func refreshTokensFromRefreshUrl() {
        //Need to implement fetching accesstoke from api
        //Need to do refreshtoken
        mStorage?.updateValues(accessToken: "accesstoken", refreshToken: "refreshtoken", mcpttId: "mcpttid", expiryTime: 23, bearerType: "type")
    }

    public func fetchTokenDetails() -> PttAccessToken? {
            if let mStorage = mStorage {
            let accessToken = mStorage.getAccessToken()
            let mcptt = mStorage.getMcpttId()
            let expireAt = mStorage.getExpiryTime()
            
            guard let accessTokenValue = accessToken, let expireAtValue = expireAt else {
                return nil
            }
            return PttAccessToken.init(accessToken: accessTokenValue, mcPttId: mcptt, validity: expireAtValue)
        }
        return nil
    }
}
