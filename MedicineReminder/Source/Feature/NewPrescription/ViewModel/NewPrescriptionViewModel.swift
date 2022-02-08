//
//  NewPrescriptionViewModel.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

class NewPrescriptionViewModel: NewPrescriptionViewModelProtocol {
    var prescriptions:[Prescription] = []
    var db:DBHelper = DBHelper()
    
    func storeData(name: String, timeToTime: String, firstTime: String) {
        db.insert(name: name, timeToTime: timeToTime, firstTime: firstTime)
    }
    
}
