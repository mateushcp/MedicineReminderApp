//
//  NewPrescriptionViewProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

protocol NewPrescriptionViewProtocol where Self: UIView {
    var didTapIncludeNew: (() -> Void)? { get set }
    var content: ((String, String, String) -> Void)? { get set }
}
