//
//  Reminder.swift
//  TimeToMove
//
//  Created by tunix on 08/08/23.
//

import Foundation
import UserNotifications

class Reminder {
  
  private var timer: Timer?
  private let preferences = UserDefaults.standard
  private let notificationCenter = UNUserNotificationCenter.current()
  
  func startTimer() {
    let intervalInSecs: TimeInterval  = preferences.intervalAsSeconds()
    scheduleNotification(every: intervalInSecs)
  }
  
  private func scheduleNotification(every timeInterval: TimeInterval) {
    let notification = UNMutableNotificationContent()
    notification.title     = "Time To Move!"
    notification.subtitle  = "It's time to move a little"
    notification.body      = "It's been \(preferences.intervalAsString()) since your last move."
    
    if preferences.isSoundEnabled() {
      notification.sound   = UNNotificationSound.default
    }
    
    let trigger            = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: true)
    let formatter          = DateComponentsFormatter()
    
    formatter.unitsStyle   = .abbreviated
    formatter.allowedUnits = [.hour, .minute]
    let nextDate           = formatter.string(from: trigger.nextTriggerDate()?.timeIntervalSinceNow ?? 0.0)
    
    let uuidString = UUID().uuidString
    let request = UNNotificationRequest(identifier: uuidString,
                                        content: notification,
                                        trigger: trigger)
    notificationCenter.add(request)
  }
  
  func reset() {
    notificationCenter.removeAllDeliveredNotifications()
    notificationCenter.removeAllPendingNotificationRequests()
    startTimer()
  }
  
}
