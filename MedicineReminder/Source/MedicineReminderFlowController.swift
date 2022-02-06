//
//  MedicineReminderFlowController.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

class MedicineReminderFlowController {
    private let viewModelFactory: ViewModelFactoryProtocol
    private let viewControllerFactory: ViewControllerFactoryProtocol
    private var navigationController: UINavigationController?
    
    public init() {
        self.viewModelFactory = ViewModelFactory()
        self.viewControllerFactory = ViewControllerFactory(viewModelFactory: viewModelFactory)
        
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() -> UIWindow {
        self.navigationController = UINavigationController(rootViewController: viewControllerFactory.makeIntroScreenViewController(delegate: self))
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return window
    }
}

extension MedicineReminderFlowController: IntroScreenFlowDelegate {
    func goToCheckPrescription() {
        let controller = viewControllerFactory.makeCheckPrescriptionsViewController(delegate: self)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func goToNewPrescription() {
        let controller = viewControllerFactory.makeNewPrescriptionViewController(delegate: self)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}

extension MedicineReminderFlowController: NewPrescriptionFlowDelegate {
    func goToHome() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension MedicineReminderFlowController: CheckPrescriptionFlowDelegate {
    
}
