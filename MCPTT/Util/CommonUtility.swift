//
//  CommonUtility.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

private let firstTimeLunchKey = "APPLUNCHED"
private let loggedInKey = "LOGGEDIN"

final class CommonUtility {
    
    static func appLaunchFirstTime() {
        UserDefaults.standard.set(true, forKey: firstTimeLunchKey)
    }
    
    static func isAlreadyLunched() -> Bool {
        let value = UserDefaults.standard.bool(forKey: firstTimeLunchKey)
        return value
    }
    
    static func userLoggedIn(value: Bool) {
        UserDefaults.standard.set(value, forKey: loggedInKey)
    }
    
    static func isAlreadyLoggedIn() -> Bool {
        let value = UserDefaults.standard.bool(forKey: loggedInKey)
        return value
    }
    
    static func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertActionStyle)], completion: @escaping (_ index: Int) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        viewController.present(alertViewController, animated: true, completion: nil)
    }
}
