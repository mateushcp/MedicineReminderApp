//
//  IntroScreenViewController.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation
import UIKit

class IntroScreenViewController: UIViewController, IntroScreenViewControllerProtocol {
    var delegate: IntroScreenFlowDelegate?
    private var contentView: IntroScreenViewProtocol
    
    init(delegate: IntroScreenFlowDelegate, contentView: IntroScreenViewProtocol) {
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
        contentView.didPressInclude = { [weak self] in
            self?.delegate?.goToNewPrescription()
        }
        
        contentView.didPressCheck = { [weak self] in
            self?.delegate?.goToCheckPrescription()
        }
    }
    
    private func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
            
    }
    
    private func setupController() {
        view.addSubview(contentView)
        self.view.backgroundColor = UIColor.white
        
        contentView.bindFrameToSuperviewBounds()
    }
}
