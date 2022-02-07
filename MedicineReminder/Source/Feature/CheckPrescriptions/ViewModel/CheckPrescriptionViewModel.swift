//
//  CheckPrescriptionViewModel.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CheckPrescriptionViewModel: CheckPrescriptionViewModelProtocol {
    var prescriptions:[Prescription] = []
    var db:DBHelper = DBHelper()
    
    func deleteDataInSelectedRow(name: String) {
        db.deleteByName(name: name)
    }

}
