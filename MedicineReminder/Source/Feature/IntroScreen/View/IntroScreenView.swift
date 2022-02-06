//
//  IntroScreenView.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation
import UIKit

class IntroScreenView: UIView, IntroScreenViewProtocol {
    var didPressInclude: (() -> Void)?
    var didPressCheck: (() -> Void)?
    // MARK: - variables
    
    private lazy var appIcon: UIImageView = {
        let variable = UIImageView(image: UIImage.iconImage)
        variable.contentMode = .scaleAspectFit
        variable.clipsToBounds = true
        variable.isUserInteractionEnabled = false
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    let newPrescriptionLabel: UIButton = {
        let variable = UIButton()
        variable.setTitle("Include_recipes".localized, for: .normal)
        variable.titleLabel?.font  = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.titleLabel?.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.setTitleColor(Colors.appTheme, for: .normal)
        variable.layer.borderColor = Colors.appTheme.cgColor
        variable.layer.borderWidth = Metrics.Spacing.cornerButton
        variable.layer.cornerRadius = Metrics.Spacing.small
        variable.layer.masksToBounds = true
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.addTarget(self, action: #selector(didTapNew), for: .touchUpInside)
        return variable
    }()
    
    let checkPrescriptionLabel: UIButton = {
        let variable = UIButton()
        variable.setTitle("Check_recipes".localized, for: .normal)
        variable.titleLabel?.font  = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.titleLabel?.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.setTitleColor(Colors.appTheme, for: .normal)
        variable.layer.borderColor = Colors.appTheme.cgColor
        variable.layer.borderWidth = Metrics.Spacing.cornerButton
        variable.layer.cornerRadius = Metrics.Spacing.small
        variable.layer.masksToBounds = true
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.addTarget(self, action: #selector(didTapCheck), for: .touchUpInside)
        return variable
    }()
    
    private lazy var detailMessage: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.attributedText = "Detail_Message".localized.attributedStringWithColor(["saúde"], color: Colors.red)
        variable.textAlignment = NSTextAlignment.center
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private let zeroRawValue = 0
    
    @objc func didTapNew(){
        didPressInclude?()
    }
    
    @objc func didTapCheck(){
        didPressCheck?()
    }
    // MARK: - setup
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error, not implemented")
    }
    // MARK: - private functions
    
    private func setupUI() {
        addSubview(appIcon)
        addSubview(newPrescriptionLabel)
        addSubview(checkPrescriptionLabel)
        addSubview(detailMessage)
        
        setupConstraints()
    }
    private func setupConstraints() {
        appIcon.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.greatest).isActive = true
        appIcon.widthAnchor.constraint(equalToConstant: Metrics.Spacing.iconMenu).isActive = true
        
        setLabelConstraints(to: newPrescriptionLabel, topElement: appIcon, isBellowMainIcon: true)
        
        setLabelConstraints(to: checkPrescriptionLabel, topElement: newPrescriptionLabel, isBellowMainIcon: false)
        
        detailMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.large).isActive = true
        detailMessage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    private func setLabelConstraints(to element: UIView, topElement: UIView, isBellowMainIcon: Bool) {
        if isBellowMainIcon == true {
            element.topAnchor.constraint(equalTo: topElement.bottomAnchor, constant: Metrics.Spacing.greatest).isActive = true
        } else {
            element.topAnchor.constraint(equalTo: topElement.bottomAnchor, constant: Metrics.Spacing.large).isActive = true
        }
        element.heightAnchor.constraint(equalToConstant: Metrics.Spacing.huge).isActive = true
        element.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        element.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
   
    }
}
