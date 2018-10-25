//
//  SimManager.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 22/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class SimManager {
    //To do need to know about Context
    public func getSimOperator() -> String {
        let operattor = Mno.getMockOperatorCode()
        //Need to implement TextUtils
        return operattor
    }
}
