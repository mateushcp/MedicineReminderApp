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
        let hoursTime = (doubleHour * 3600) + ( doubleMinute * 60)
        return hoursTime
    }
    
    func handleTimeInterval(firstTime: String, timeToTime: String, checked: Bool) -> Double {
        var timeInterval: Double = 00.00
        let hoursFromFirst = returnHourFirst(time: firstTime)
        let minutesFromFirst = returnMinuteFirst(time: firstTime)
        let hourDate = Calendar.current.component(.hour, from: Date())
        if checked {
            timeInterval =  handleToInt(time: timeToTime) * 3600
        } else {
          //TODO: implementar regra para enviar caso selecione horario
        }
        
        return timeInterval
    }
    
    func notifications(name: String, timeToTime: String, firstTime: String, checked: Bool) {
        let center = UNUserNotificationCenter.current()
//        getTimeForNotification(string: firstTime)
        let content = UNMutableNotificationContent()
        content.title = "Chegou a hora de tomar \(name)"
        content.body = "Lembre que você deve ingerir este remédio de \(timeToTime)"
        content.sound = UNNotificationSound.default
    
//        let timeInterval = handleToInt(time: timeToTime) // * 3600
      
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: handleTimeInterval(firstTime: firstTime, timeToTime: timeToTime, checked: checked),
            repeats: true)
//        db.createNotificationsTable()
//        db.insertNotificationsTable(name: firstTime, timeToTime: getTimeForNotification(string: firstTime))
        //primeiro alarme fixo vai ser definido aqui
        //case horario == horarioatual: request = timeToTime(8em8) * 3600
        //case horario < horarioatual: request = ((horarioAtual - firstTime) + TimeToTime(8em8h)) * 3600
        // final = 8tempoemtempo - (19atual - 17primeiro)
        // 8 - 2 = 6 horas
        // finalDepois = 8
        //case horario > horarioatual: request = ((horario - horarioAtual) + timeToTime) * 3600
        
//        DispatchQueue.global(qos: .background).async {
////            self.db.readNotifications()
//            //deletar notificaçao anterior
//            //inserir nova notificaçao com base no banco para daqui 8 em 8, por ex
//            let request = UNNotificationRequest(identifier: firstTime, content: content, trigger: trigger)
//        }
        
        let requestFirstAlarm = ""
        let request = UNNotificationRequest(identifier: name, content: content, trigger: trigger)
        
        center.add(request)
    }

    //atual + selecionado usar first time como identifiers
}
