//
//  MediaInfo.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

public class MediaInfo {
    var floorId: Int32
    var mediaType: Int32
    var direction: Int32
    var communicationType: Int32
    
    init(floorId: Int32, mediaType: Int32, direction: Int32, communicationType: Int32) {
        self.floorId = floorId
        self.mediaType = mediaType
        self.direction = direction
        self.communicationType = communicationType
    }
}
