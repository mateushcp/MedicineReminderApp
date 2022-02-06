//
//  IntroScreenViewControllerDelegate.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation
import UIKit

protocol IntroScreenFlowDelegate: AnyObject {
    func goToNewPrescription()
    func goToCheckPrescription()
}
