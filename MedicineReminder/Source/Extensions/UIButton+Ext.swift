//
//  UIButton+Ext.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 07/02/22.
//

import Foundation
import UIKit

extension UIButton {
    override open var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1.0
            }
            else {
                self.alpha = 0.5
            }
            self.layoutIfNeeded()
        }
    }
}
