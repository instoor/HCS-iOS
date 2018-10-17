//
//  Date+Extensions.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

extension Date {
    
    func toMilisecond() -> Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }
}
