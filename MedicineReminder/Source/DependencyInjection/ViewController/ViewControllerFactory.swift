//
//  ViewControllerFactory.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    private let viewModelFactory: ViewModelFactoryProtocol
    
    init(viewModelFactory: ViewModelFactoryProtocol) {
        self.viewModelFactory = viewModelFactory
    }
    
    func makeIntroScreenViewController(delegate: IntroScreenFlowDelegate) -> IntroScreenViewControllerProtocol {
        let contentView = IntroScreenView()
        let viewController = IntroScreenViewController(delegate: delegate, contentView: contentView)
        
        return viewController
    }
    
    func makeNewPrescriptionViewController(delegate: NewPrescriptionFlowDelegate) -> NewPrescriptionViewControllerProtocol {
        let contentView = NewPrescriptionView()
        let viewModel = viewModelFactory.makeNewPrescriptionViewModel()
        let viewController = NewPrescriptionViewController(delegate: delegate, viewModel: viewModel, contentView: contentView)
        
        return viewController
    }
    
    func makeCheckPrescriptionsViewController(delegate: CheckPrescriptionFlowDelegate) -> CheckPrescriptionsViewControllerProtocol {
        let contentView = CheckPrescriptionsView()
        let viewModel = viewModelFactory.makeCheckPrescriptionViewModel()
        let viewController = CheckPrescriptionsViewController(delegate: delegate, viewModel: viewModel, contentView: contentView)
        
        return viewController
    }
}
