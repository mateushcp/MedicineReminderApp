//
//  NewPrescriptionViewModel.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit
import UserNotifications

class NewPrescriptionViewModel: NewPrescriptionViewModelProtocol {
    var prescriptions:[Prescription] = []
    var db:DBHelper = DBHelper()
    
    func storeData(name: String, timeToTime: String, firstTime: String) {
        db.insert(name: name, timeToTime: timeToTime, firstTime: firstTime)
    }
    
    private func handleTime(timeToTime: String) -> String {
            var timeToTime = timeToTime
            switch timeToTime {
            case "2 em 2 horas":
                timeToTime = "2"
            case "4 em 4 horas":
                timeToTime = "4"
            case "6 em 6 horas":
                timeToTime = "6"
            case "8 em 8 horas":
                timeToTime = "8"
            case "12 em 12 horas":
                timeToTime = "4"
            default:
                timeToTime = "8"
            }
            return timeToTime
        }
        
        func handleToInt(time: String) -> Double {
            let timeToInt = handleTime(timeToTime: time)
            let myInt = (timeToInt as NSString).integerValue
            
            return Double(myInt)
        }
    
    func notifications(name: String, timeToTime: String, firstTime: String) {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Chegou a hora de tomar \(name)"
        content.body = "Lembre que você deve ingerir este remédio de \(timeToTime)"
        content.sound = UNNotificationSound.default
        
        let timeInterval = handleToInt(time: timeToTime)
        let date = Date().addingTimeInterval(timeInterval)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "random", content: content, trigger: trigger)
        
        center.add(request)
    }
    
}
