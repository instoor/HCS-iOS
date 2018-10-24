//
//  InjectorManager.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class InjectionManager {
    static let shared = InjectionManager()
    private var injector: Injector

    private init() {
        self.injector = Injector()
    }

    func createChannel(pttUrl: PttUrl) -> Channel1 {
        return injector.creatChannel(for: pttUrl)
    }
    
    // TODO: Implement other method.
}
