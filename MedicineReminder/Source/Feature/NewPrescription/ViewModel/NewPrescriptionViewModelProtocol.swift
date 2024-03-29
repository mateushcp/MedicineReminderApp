//
//  NewPrescriptionViewModelProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation

protocol NewPrescriptionViewModelProtocol {
    func storeData(name: String, timeToTime: String, firstTime: String)
    func notifications(name: String, timeToTime: String, firstTime: String, checked: Bool)
    func handleToInt(time: String) -> Double
}
