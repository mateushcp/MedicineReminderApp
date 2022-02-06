//
//  ViewModelFactory.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation

class ViewModelFactory: ViewModelFactoryProtocol {
    func makeCheckPrescriptionViewModel() -> CheckPrescriptionViewModelProtocol {
        let viewModel = CheckPrescriptionViewModel()
        
        return viewModel
    }
    
    func makeNewPrescriptionViewModel() -> NewPrescriptionViewModelProtocol {
        let viewModel = NewPrescriptionViewModel()
        
        return viewModel
    }
}
