//
//  ViewModelFactoryProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func makeNewPrescriptionViewModel() -> NewPrescriptionViewModelProtocol
    func makeCheckPrescriptionViewModel() -> CheckPrescriptionViewModelProtocol
}
