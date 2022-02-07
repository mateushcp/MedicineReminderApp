//
//  CheckPrescriptionsViewProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

protocol CheckPrescriptionsViewProtocol where Self: UIView {
    var didDeleteData: ((String) -> Void)? { get set }

}

