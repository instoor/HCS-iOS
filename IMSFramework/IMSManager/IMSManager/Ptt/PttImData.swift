//
//  PttImData.swift
//  MCPTT
//
//  Created by Abhishek Shrivastava on 10/23/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

open class PttImData {
    private var mCallType: Int
    private var mParticipitants: [String]
    private var mContentType: String
    private var mContentBody: String
    private var mMessageType: Int
   public init(mCallType: Int, mParticipitants: [String], mContentType: String, mContentBody: String, mMessageType: Int) {
        self.mCallType = mCallType
        self.mParticipitants = mParticipitants
        self.mContentType = mContentType
        self.mContentBody = mContentBody
        self.mMessageType = mMessageType
    }
    public func getParticipants() -> [String] {
        return mParticipitants
    }
    public func getCallType() -> Int {
        return mCallType
    }
    public func getContentType() -> String {
        return mContentType
    }
    public func getContentBody() -> String {
        return mContentBody
    }
    public func getMessageType() -> Int {
        return mMessageType
    }
}
