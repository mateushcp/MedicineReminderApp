//
//  CheckPrescriptionsViewController.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CheckPrescriptionsViewController: UIViewController, CheckPrescriptionsViewControllerProtocol {
    weak var delegate: CheckPrescriptionFlowDelegate?
    private var contentView: CheckPrescriptionsViewProtocol
    private var viewModel: CheckPrescriptionViewModelProtocol
    
    init(delegate: CheckPrescriptionFlowDelegate, viewModel: CheckPrescriptionViewModelProtocol, contentView: CheckPrescriptionsViewProtocol) {
        self.contentView = contentView
        self.delegate = delegate
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func didTapAd(){
        self.delegate?.goToPrescription()
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
        let add = UIBarButtonItem(image: UIImage.addNew, style: .plain, target: self, action: #selector(didTapAd))
        self.navigationItem.rightBarButtonItem  = add
    }
    
    private func bindView() {
        contentView.didDeleteData = { [weak self] selectedRow in
            self?.viewModel.deleteDataInSelectedRow(id: selectedRow)
        }
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
        self.title = "Check_Title".localized

    }
    
    private func setupController() {
        view.addSubview(contentView)
        self.view.backgroundColor = UIColor.white
        
        contentView.bindFrameToSuperviewBounds()
    }
    
}
