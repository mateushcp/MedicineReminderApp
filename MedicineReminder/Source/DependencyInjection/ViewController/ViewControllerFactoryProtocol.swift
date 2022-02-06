//
//  ViewControllerFactoryProtocol.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation

protocol ViewControllerFactoryProtocol: AnyObject {
    func makeIntroScreenViewController(delegate: IntroScreenFlowDelegate) -> IntroScreenViewControllerProtocol
    func makeNewPrescriptionViewController(delegate: NewPrescriptionFlowDelegate) -> NewPrescriptionViewControllerProtocol
    func makeCheckPrescriptionsViewController(delegate: CheckPrescriptionFlowDelegate) -> CheckPrescriptionsViewControllerProtocol
}
