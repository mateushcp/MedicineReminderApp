//
//  NewPrescriptionViewController.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

class NewPrescriptionViewController: UIViewController, NewPrescriptionViewControllerProtocol {
    weak var delegate: NewPrescriptionFlowDelegate?
    private var contentView: NewPrescriptionViewProtocol
    
    init(delegate: NewPrescriptionFlowDelegate, viewModel: NewPrescriptionViewModelProtocol, contentView: NewPrescriptionViewProtocol) {
        self.contentView = contentView
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        
        bindView()
                
    }
    
    private func bindView() {

    }
    
    private func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Colors.appTheme]
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.iconImage
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.backButton
        self.navigationController?.navigationBar.tintColor = Colors.appTheme
        self.navigationController?.navigationBar.backItem?.title = ""
        self.title = "New_Title".localized
    }
    
    private func setupController() {
        view.addSubview(contentView)
        self.view.backgroundColor = UIColor.white
        
        contentView.bindFrameToSuperviewBounds()
    }
}