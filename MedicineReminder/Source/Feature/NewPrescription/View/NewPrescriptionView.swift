//
//  NewPrescriptionView.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//


import Foundation
import UIKit

class NewPrescriptionView: UIView, NewPrescriptionViewProtocol {
    // MARK: - variables

    // MARK: - setup

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error, not implemented")
    }
    // MARK: - private functions
    
    private func setupUI() {
        self.backgroundColor = .white
        
        setupConstraints()
    }
    private func setupConstraints() {

    }
}
