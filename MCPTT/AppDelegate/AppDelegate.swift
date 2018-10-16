//
//  AppDelegate.swift
//  MCPTT
//
//  Created by Arvind Sharma on 09/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import UIKit
import PushKit
import CallKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PKPushRegistryDelegate, CXProviderDelegate {

    var window: UIWindow?
    private var voipRegistry: PKPushRegistry?
    private var voipNotificationRaised: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        registerForPushNotifications()

        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        return true
    }
    
    // Registering for the push notification permission in the app
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            self.voipRegistry = PKPushRegistry.init(queue: DispatchQueue.main)
            self.voipRegistry?.delegate = self
            self.voipRegistry?.desiredPushTypes = [PKPushType.voIP]
        }
    }
    
    // MARK: Pushkit's delegates methods
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        NSLog("pushRegistry:didUpdatePushCredentials:forType:")
        
        if (type != .voIP) {
            return
        }
        NSLog("voip token: \(pushCredentials.token)")
        print(pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined())
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        
        let payloadDict = payload.dictionaryPayload["aps"] as? Dictionary<String, String>
        let messageBody = payloadDict?["body"]
        let messageTitle = payloadDict?["title"]
        let messageSubtitle = payloadDict?["subtitle"]
       
        ///TBD: We can remove it in future.
//        let type = payloadDict?["type"]
        
        let content = UNMutableNotificationContent()
        content.title = messageTitle ?? ""
        content.subtitle = messageSubtitle ?? ""
        content.body = messageBody ?? ""
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        voipNotificationRaised = true
  
          ///TBD: We will remove this code after  confirmation on APNS
//        if type == "message" {
//            let content = UNMutableNotificationContent()
//            content.title = messageTitle ?? ""
//            content.subtitle = messageSubtitle ?? ""
//            content.body = messageBody ?? ""
//            content.sound = UNNotificationSound.default()
//
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
//            let uuidString = UUID().uuidString
//            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//            voipNotificationRaised = true
//
//        } else if type == "call" {
//
//            let config = CXProviderConfiguration(localizedName: "MCPTT")
//            config.ringtoneSound = "ringtone.caf"
//            let provider = CXProvider(configuration: config)
//            provider.setDelegate(self, queue: nil)
//            let update = CXCallUpdate()
//            update.remoteHandle = CXHandle(type: .generic, value: "Sanju Toor")
//            provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
//        }
    }
    
    private func pushRegistry(registry: PKPushRegistry!, didInvalidatePushTokenForType type: String!) {
        
        NSLog("token invalidated")
    }
   
    // MARK: Callkit's delegate method
    func providerDidReset(_ provider: CXProvider) {
        
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        guard voipNotificationRaised else {
            fatalError("voip push notification is not received")
        }
        let conversationViewController = ConversationViewController.instantiate(storyboardName: "Channel", storyboardId: "ConversationViewController")
        self.window?.rootViewController = conversationViewController
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    class func sharedDelegate () -> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

}
