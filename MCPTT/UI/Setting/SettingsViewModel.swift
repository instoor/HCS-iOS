//
//  SettingsViewModel.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

final class SettingsViewModel {
    var defaultSettings = [SettingsCellViewModel]()
    var messageSettings = [SettingsCellViewModel]()
    var notificationSettings = [SettingsCellViewModel]()
    
    func initFetch() {
        processFetchedData()
    }
    private func processFetchedData() {
       defaultSettings.append(SettingsCellViewModel.init(title: "Home channel", subTitle: "_channel name_"))
       defaultSettings.append(SettingsCellViewModel.init(title: "Call priority", subTitle: "PTT Call"))
       defaultSettings.append(SettingsCellViewModel.init(title: "Emergency group", subTitle: "_group name_"))
       defaultSettings.append(SettingsCellViewModel.init(title: "Auto recording", subTitle: "Always"))
        
       defaultSettings.append(SettingsCellViewModel.init(title: "Message auto delete", subTitle: "Keep only messages/PTT/recording within 48hours"))
    
       notificationSettings.append(SettingsCellViewModel.init(title: "Alert tone", subTitle: nil))
       notificationSettings.append(SettingsCellViewModel.init(title: "Vibration", subTitle: nil))
        
    }
}

struct SettingsCellViewModel {
    let title: String?
    let subTitle: String?
}
