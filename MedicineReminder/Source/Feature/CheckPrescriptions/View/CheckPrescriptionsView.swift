//
//  CheckPrescriptionsView.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CheckPrescriptionsView: UIView, CheckPrescriptionsViewProtocol {

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

            
            setupConstraints()
        }
        private func setupConstraints() {
           
            
        }

    }
