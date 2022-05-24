//
//  CheckPrescriptionViewModel.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit
import UserNotifications

class CheckPrescriptionViewModel: CheckPrescriptionViewModelProtocol {
    var prescriptions:[Prescription] = []
    var db:DBHelper = DBHelper()
    
    func deleteDataInSelectedRow(id: Int, identifier: String) {
        db.deleteByID(id: id)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }

}
