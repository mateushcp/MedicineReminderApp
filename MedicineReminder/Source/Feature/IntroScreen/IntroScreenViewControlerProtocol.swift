//
//  IntroScreenViewControlerProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation
import UIKit

protocol IntroScreenViewControllerProtocol where Self: UIViewController {
    var delegate: IntroScreenFlowDelegate? { get set }
}
