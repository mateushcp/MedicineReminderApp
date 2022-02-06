//
//  NewPrescriptionViewModel.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation

class NewPrescriptionViewModel: NewPrescriptionViewModelProtocol {
  
    func storeData(name: String, timeToTime: String) {
        UserDefaults.standard.set(name, forKey: "nameKey")
        UserDefaults.standard.set(timeToTime, forKey: "timeKey")
    }
    
}
