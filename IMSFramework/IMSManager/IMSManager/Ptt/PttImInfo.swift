//
//  PttImInfo.swift
//  MCPTT
//
//  Created by Abhishek Shrivastava on 10/23/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

open class PttImInfo {
    private var mSessionId: Int
    private var mChatId: Int
    init( ) {
        self.mSessionId = -1
        self.mChatId = -1
    }
    /**
     * Get current sessionId
     *
     * @return sessionId
     */
    public func getSessionId() -> Int {
        return mSessionId
    }
    /**
     * Sets current sessionId
     */
    public func setSessionId(mSessionId: Int) {
         self.mSessionId = mSessionId
    }
    /**
     * Get current chatId
     */
    public func getChatId() -> Int {
        return mChatId
    }
    /**
     * Sets current chatId
     *
     * @return chatId
     */
    public func setChatId(mChatId: Int) {
     self.mChatId = mChatId
    }
}
