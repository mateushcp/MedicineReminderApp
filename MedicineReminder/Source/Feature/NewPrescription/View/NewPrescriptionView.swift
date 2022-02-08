//
//  NewPrescriptionView.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//


import Foundation
import UIKit

class NewPrescriptionView: UIView, NewPrescriptionViewProtocol {
    var didTapIncludeNew: (() -> Void)?
    var content: ((String, String) -> Void)?
    // MARK: - variables
    
    private lazy var addPrescriptionText: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.text = "Add_Text".localized
        variable.numberOfLines = zeroRawValue
        variable.textAlignment = NSTextAlignment.center
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var nameText: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.text = "Name_Text".localized
        variable.numberOfLines = zeroRawValue
        variable.textAlignment = NSTextAlignment.left
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var timeToTimeText: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.text = "Time_Text".localized
        variable.numberOfLines = zeroRawValue
        variable.textAlignment = NSTextAlignment.left
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var tipText: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.attributedText = "Tip_text".localized.attributedStringWithColor(["DaHora"], color: Colors.red)
        variable.numberOfLines = zeroRawValue
        variable.textAlignment = NSTextAlignment.center
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var nameField: UITextField = {
        let variable = UITextField()
        variable.attributedPlaceholder = NSAttributedString(
            string: "Name_Holder".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholder]
        )
        variable.heightAnchor.constraint(equalToConstant: Metrics.Spacing.bigger).isActive = true
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.textColor = Colors.appTheme
        variable.layer.borderWidth = 0.7
        variable.layer.cornerRadius = 4
        variable.layer.borderColor = Colors.appTheme.cgColor
        variable.keyboardType = .emailAddress
        variable.addPadding(padding: .left(Metrics.Spacing.small))
        variable.textAlignment = .left
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var timeToTimeField: UITextField = {
        let variable = UITextField()
        variable.attributedPlaceholder = NSAttributedString(
            string: "Time_Holder".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholder]
        )
        variable.textColor = Colors.appTheme
        variable.layer.borderWidth = 0.7
        variable.heightAnchor.constraint(equalToConstant: Metrics.Spacing.greater).isActive = true
        variable.widthAnchor.constraint(equalToConstant: Metrics.Spacing.superDupper).isActive = true
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.layer.cornerRadius = 4
        variable.layer.borderColor = Colors.appTheme.cgColor
        variable.keyboardType = .emailAddress
        variable.textAlignment = .center
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.inputView = pickerTime
        return variable
    }()
    
    private lazy var pickerTime: UIPickerView = {
        let variable = UIPickerView()
        variable.delegate = self
        variable.dataSource = self
        return variable
    }()
    
    private lazy var stack: UIStackView = {
        let variable = UIStackView()
        variable.axis = .vertical
        variable.distribution = .fillProportionally
        variable.translatesAutoresizingMaskIntoConstraints = false
        
        return variable
    }()
    
    let includeButton: UIButton = {
        let variable = UIButton()
        variable.setTitle("Include_Button".localized, for: .normal)
        variable.titleLabel?.font  = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.titleLabel?.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.buttonTitle)
        variable.setTitleColor(Colors.white, for: .normal)
        variable.backgroundColor = Colors.cellBackGround
        variable.layer.cornerRadius = Metrics.Spacing.small
        variable.heightAnchor.constraint(equalToConstant: Metrics.Spacing.buttonHeight).isActive = true
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.isEnabled = false
        variable.addTarget(self, action: #selector(didTapInclude), for: .touchUpInside)
        return variable
    }()
    
    private let timeToTime = ["2 em 2 horas","4 em 4 horas","6 em 6 horas","8 em 8 horas", "12 em 12 horas"]
    private let zeroRawValue = 0
    
    @objc func didTapInclude(){
        didTapIncludeNew?()
        content?(nameField.text ?? "", timeToTimeField.text ?? "")
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.buttonIsEnabled()
    }
    
    func buttonIsEnabled() {
        
        if nameField.text != "" && timeToTimeField.text != "" {
            includeButton.isEnabled = true
            includeButton.backgroundColor = Colors.appTheme
        }
        
    }
    
    // MARK: - setup
    
    init() {
        super.init(frame: .zero)
        setupUI()
        
        nameField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)),for: UIControl.Event.editingDidEnd)
        timeToTimeField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)),for: UIControl.Event.editingDidEnd)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error, not implemented")
    }
    // MARK: - private functions
    
    private func setupUI() {
        
        addSubview(addPrescriptionText)
        addSubview(nameText)
        addSubview(nameField)
        addSubview(timeToTimeText)
        addSubview(timeToTimeField)
        addSubview(tipText)
        addSubview(includeButton)
        
        setupConstraints()
    }
    private func setupConstraints() {
        
        addPrescriptionText.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.large).isActive = true
        addPrescriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        addPrescriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        
        nameText.topAnchor.constraint(equalTo: addPrescriptionText.bottomAnchor, constant: Metrics.Spacing.greater).isActive = true
        nameText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        
        nameField.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: Metrics.Spacing.medium).isActive = true
        nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        
        timeToTimeText.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: Metrics.Spacing.greater).isActive = true
        timeToTimeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        
        timeToTimeField.topAnchor.constraint(equalTo: timeToTimeText.bottomAnchor, constant: Metrics.Spacing.medium).isActive = true
        timeToTimeField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        
        
        tipText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        tipText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        tipText.bottomAnchor.constraint(equalTo: includeButton.topAnchor, constant: -Metrics.Spacing.greater).isActive = true
        
        
        includeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.large).isActive = true
        includeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        includeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        
    }
    
    private func setTexts(to element: UIView) {
        element.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: Metrics.Spacing.medium).isActive = true
    }
    
}

extension NewPrescriptionView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeToTime.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        timeToTime[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeToTimeField.text = timeToTime[row]
        timeToTimeField.resignFirstResponder()
    }
}
