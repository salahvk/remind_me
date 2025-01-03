import UIKit
import Flutter
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    GeneratedPluginRegistrant.register(with: self)
    
    let controller = window?.rootViewController as! FlutterViewController

    // Date and Time Picker Channel
    let dateTimeChannel = FlutterMethodChannel(
        name: "remind_me_ios/dateTimeChannel", 
        binaryMessenger: controller.binaryMessenger
    )
    
    dateTimeChannel.setMethodCallHandler { [weak self] (call, result) in
        if call.method == "showDatePicker" {
            self?.showDatePicker(controller: controller, result: result)
        } else if call.method == "showTimePicker" {
            self?.showTimePicker(controller: controller, result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    // Schedule Notification Channel
    let notificationChannel = FlutterMethodChannel(
        name: "remind_me_ios/notificationChannel", 
        binaryMessenger: controller.binaryMessenger
    )
    
    notificationChannel.setMethodCallHandler { [weak self] (call, result) in
        if call.method == "scheduleNotification" {
            self?.scheduleNotification(call: call, result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  //  Date Picker Handler
  func showDatePicker(controller: UIViewController, result: @escaping FlutterResult) {
    let dateTimePickerVC = DateTimePickerViewController()
    dateTimePickerVC.completion = { selectedDate in
        result(selectedDate)
    }
    controller.present(dateTimePickerVC, animated: true, completion: nil)
  }

  
 func showTimePicker(controller: UIViewController, result: @escaping FlutterResult) {
    
    let alertController = UIAlertController(title: "Pick a Time", message: nil, preferredStyle: .alert)

    
    let datePicker = UIDatePicker()
    datePicker.datePickerMode = .time 
    datePicker.minuteInterval = 1 
    datePicker.frame = CGRect(x: 10, y: 50, width: 250, height: 150) 

    
    alertController.view.addSubview(datePicker)
    alertController.view.heightAnchor.constraint(equalToConstant: 250).isActive = true

    // "Done" button to alert controller
    alertController.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" 
        let timeString = formatter.string(from: datePicker.date)
        result(timeString) 
    }))

    //  "Cancel" button to alert controller
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        result(nil) // Returning nil if the user cancels
    }))

    // Present the UIAlertController
    controller.present(alertController, animated: true, completion: nil)
}


  //  Schedule Notification Handler
func scheduleNotification(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any],
          let taskId = args["taskId"] as? String,
          let title = args["title"] as? String,
          let description = args["description"] as? String,
          let timeMillis = args["timeMillis"] as? Int else {
      result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for notification", details: nil))
      return
    }

    let content = UNMutableNotificationContent()
    content.title = title
    content.body = "Task: \(title) - \(description)" // Custom message with task title
    content.sound = .default

    // Trigger the notification at the specified time
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timeMillis / 1000), repeats: false)

    let request = UNNotificationRequest(identifier: taskId, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request) { error in
      if let error = error {
        result(FlutterError(code: "NOTIFICATION_ERROR", message: error.localizedDescription, details: nil))
      } else {
        result("Notification scheduled successfully")
        
        // Trigger haptic feedback when a task is scheduled
        self.triggerHapticFeedback()
      }
    }
  }

  //  Trigger Haptic Feedback
  func triggerHapticFeedback() {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    feedbackGenerator.prepare()
    feedbackGenerator.impactOccurred()
  }

  //  Schedule Local Notification
  func scheduleLocalNotification(taskId: String, title: String, description: String, timeInterval: TimeInterval) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = description
    content.sound = .default
    content.userInfo = ["taskId": taskId]
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
    
    let request = UNNotificationRequest(identifier: taskId, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        } else {
            print("Notification scheduled successfully.")
        }
    }
  }
}
