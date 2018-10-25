//
//  PttLoginState.swift
//  IMSManager
//
//  Created by Abhishek Shrivastava on 10/24/18.
//  Copyright © 2018 Abhishek Shrivastava. All rights reserved.
//

import Foundation

public enum PttLoginState {
    /**
     * User logged out/user entered invalid credentials etc. After
     * this user need to perform login again
     */
    case LOGGED_OUT
    /**
     * Logout is triggered by user and waiting for clean up
     * of allocated resource locally and with server, subsequent login is not
     * allowed without logout
     */
    case LOGOUT_IN_PROGRESS
    /**
     * Login is in progress, this will be posted for
     * intermediate retrying of registration with server. Application can wait
     * for login retries by IMS or trigger logout
     */
    case LOGIN_IN_PROGRESS
    /** Login successfully and app can use registered services */
    case LOGGED_IN
    
//    @Override
//    public int describeContents() {
//        return 0;
//    }
//
//    @Override
//    public void writeToParcel(Parcel dest, int arg1) {
//        dest.writeString(name());
//    }
//    /**
//     * The constant CREATOR.
//     */
//    public static final Creator<PttLoginState> CREATOR = new Creator<PttLoginState>() {
//
//        @Override
//        public PttLoginState createFromParcel(Parcel source) {
//            return PttLoginState.valueOf(source.readString());
//        }
//
//        @Override
//        public PttLoginState[] newArray(final int size) {
//            return new PttLoginState[size];
//        }
//    };
}
