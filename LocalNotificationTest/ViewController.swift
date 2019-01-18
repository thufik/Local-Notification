//
//  ViewController.swift
//  LocalNotificationTest
//
//  Created by EquipeSuporteAplicacao on 5/4/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit
import UserNotifications


public enum actions : String {
    case accept = "ACCEPT_ACTION"
    case decline = "DECLINE_ACTION"
}

public enum categories : String {
    case meeting = "MEETING_INVITATION"
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.categoryIdentifier = categories.meeting.rawValue
        notificationContent.title = "TESTE"
        notificationContent.body = "TESTANDO"
        
        guard let imageURL = Bundle.main.url(forResource: "Apple", withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: "Apple", url: imageURL, options: .none)
        
        notificationContent.attachments = [attachment]
        notificationContent.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "QUALQUER_ID", content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request, withCompletionHandler: { (requestError) in
            
            if let error = requestError{
                print("Deu merda")
            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

