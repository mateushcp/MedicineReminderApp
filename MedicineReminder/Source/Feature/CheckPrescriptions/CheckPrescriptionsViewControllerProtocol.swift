//
//  CheckPrescriptionsViewControllerProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

protocol CheckPrescriptionsViewControllerProtocol where Self: UIViewController {
    var delegate: CheckPrescriptionFlowDelegate? { get set }
}
