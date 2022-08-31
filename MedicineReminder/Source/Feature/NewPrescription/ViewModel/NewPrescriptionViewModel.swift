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
    private let hourRealTimeMultiplier: Double = 3600
    private let minuteRealTimeMultiplier: Double = 60
    
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
            timeToTime = "70"
        case "12 em 12 horas":
            timeToTime = "60"
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
    
    func returnHourFirst(time: String) -> Double {
        let hoursAndMinutes = time.components(separatedBy: ":")
        let myTime = hoursAndMinutes[0]
        return Double(myTime) ?? Double()
    }
    
    func returnMinuteFirst(time: String) -> Double {
        let hoursAndMinutes = time.components(separatedBy: ":")
        let myTime = hoursAndMinutes[1]
        return Double(myTime) ?? Double()
    }
    
    func getTimeForNotification(string: String) -> Double {
        let formatedString = string.digits
        let hourStripped = String(formatedString.dropLast(2))
        let minuteStripped = String(formatedString.dropFirst(2))
        let doubleHour = Double(hourStripped)!
        let doubleMinute = Double(minuteStripped)!
        let hoursTime = (doubleHour * hourRealTimeMultiplier) + ( doubleMinute * minuteRealTimeMultiplier)
        return hoursTime
    }
    
    func handleTimeInterval(firstTime: String, timeToTime: String, checked: Bool) -> Double {
        var timeInterval: Double = 00.00
        if checked {
            timeInterval =  handleToInt(time: timeToTime) * hourRealTimeMultiplier
        } else {
            //TODO: implementar regra para enviar caso selecione horario
        }
        
        return timeInterval
    }
    
    func notifications(name: String, timeToTime: String, firstTime: String, checked: Bool) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Chegou a hora de tomar \(name)"
        content.body = "Lembre que você deve ingerir este remédio de \(timeToTime)"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: handleTimeInterval(firstTime: firstTime, timeToTime: timeToTime, checked: checked),
            repeats: true)
        let request = UNNotificationRequest(identifier: name, content: content, trigger: trigger)
        
        center.add(request)
    }
}
