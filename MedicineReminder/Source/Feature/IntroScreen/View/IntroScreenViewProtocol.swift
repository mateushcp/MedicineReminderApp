//
//  IntroScreenViewProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation
import UIKit

protocol IntroScreenViewProtocol where Self: UIView {
    var didPressInclude: (() -> Void)? { get set }
    var didPressCheck: (() -> Void)? { get set }

}
