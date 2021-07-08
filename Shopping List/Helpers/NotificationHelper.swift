//
//  NotificationHelps.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationHelper: NSObject, UNUserNotificationCenterDelegate {
    
    //Helper method to get the authorization status for notifications
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    //Helper method to request notification authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void ) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    // Method to schedule delivery notifications
    func scheduleDeliveryRequest(name: String, address: String, numberOfItems: Int) {
        //Need three things to make a request: identifier, content, trigger
        let identifier: String = .shoppingListOrderNotificationIdentifier
        
        let content = UNMutableNotificationContent()
        content.title = "\(name)'s order"
        content.body = "Your \(numberOfItems) items will be delivered to \(address) in 15 minutes"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
