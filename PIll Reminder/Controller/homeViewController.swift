//
//  homeViewController.swift
//  Pill Reminder
//
//  Created by Fatma Almaskari | فاطمة المسكري on 6/11/20.
//  Copyright © 2020 shalchian. All rights reserved.
//
import UserNotifications
import UIKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func btn_url(_sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.drugs.com")! as URL, options: [:], completionHandler: nil)

    }
    
    @IBAction func Permision(){
        // fire test notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                // schedule test
                self.scheduleTest()
            }
            else if error != nil {
                print("error occurred")
            }
        })
    }

func scheduleTest() {
    let content = UNMutableNotificationContent()
    content.title = "Panadol"
    content.sound = .default
    content.body = "Time For Your Medicine"

    let targetDate = Date().addingTimeInterval(40)
    let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                                              from: targetDate),
                                                repeats: false)

    let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
        if error != nil {
            print("something went wrong")
        }
    })
}
}
