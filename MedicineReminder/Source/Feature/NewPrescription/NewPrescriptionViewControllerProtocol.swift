//
//  NewPrescriptionViewControllerProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

protocol NewPrescriptionViewControllerProtocol where Self: UIViewController {
    var delegate: NewPrescriptionFlowDelegate? { get set }
}
