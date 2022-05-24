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
    var content: ((String, String, String, Bool) -> Void)?
    var selectedDate: Date?
    
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
    
    private lazy var takeNow: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.text = "Taked_Text".localized
        variable.numberOfLines = zeroRawValue
        variable.lineBreakMode = .byWordWrapping
        variable.textAlignment = .left
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
    
    private lazy var timeFirstText: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.text = "First_Text".localized
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
        variable.layer.cornerRadius = Metrics.Spacing.tiny
        variable.layer.borderColor = Colors.appTheme.cgColor
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
        variable.heightAnchor.constraint(equalToConstant: Metrics.Spacing.bigger).isActive = true
        variable.widthAnchor.constraint(equalToConstant: Metrics.Spacing.superDupper).isActive = true
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.layer.cornerRadius = Metrics.Spacing.tiny
        variable.layer.borderColor = Colors.appTheme.cgColor
        variable.textAlignment = .center
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.inputView = pickerTime
        return variable
    }()
    
    private lazy var timeFirstField: UITextField = {
        let variable = UITextField()
        variable.attributedPlaceholder = NSAttributedString(
            string: "First_Holder".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholder]
        )
        variable.textColor = Colors.disabledField
        variable.layer.borderWidth = 0.7
        variable.heightAnchor.constraint(equalToConstant: Metrics.Spacing.bigger).isActive = true
        variable.widthAnchor.constraint(equalToConstant: Metrics.Spacing.superDupper).isActive = true
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.layer.cornerRadius = Metrics.Spacing.tiny
        variable.layer.borderColor = Colors.appTheme.cgColor
        variable.textAlignment = .center
        variable.inputView = pickerFirst
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var pickerFirst: UIDatePicker = {
        let variable = UIDatePicker()
        variable.datePickerMode = .time
        variable.locale = .current
        variable.preferredDatePickerStyle = .wheels
        variable.locale = .current
        variable.layer.cornerRadius = Metrics.Spacing.small
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var pickerTime: UIPickerView = {
        let variable = UIPickerView()
        variable.delegate = self
        variable.dataSource = self
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
    
    private let checkBoxButton: UIButton = {
        let variable = UIButton()
        variable.isSelected = false
        variable.setImage(UIImage.unmarkedCheckbox, for: .normal)
        variable.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
        variable.widthAnchor.constraint(equalToConstant: 64).isActive = true
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.tintColor = Colors.appTheme
        return variable
    }()
    
    private let timeToTime = ["2 em 2 horas","4 em 4 horas","6 em 6 horas","8 em 8 horas", "12 em 12 horas"]
    private let zeroRawValue = 0
    
    @objc func didTapCheckbox() {
        checkBoxButton.setImage(UIImage.markedCheckbox, for: .normal)
        timeFirstField.isEnabled = false
        timeFirstText.textColor = Colors.disabledField
        timeFirstField.textColor = Colors.disabledField
        timeFirstField.layer.borderColor = Colors.disabledField.cgColor
   }
    
    @objc func didTapInclude(){
        didTapIncludeNew?()
        if timeFirstField.text == "" {
            timeFirstField.text = "00:00"
        }
        content?(nameField.text ?? "", timeToTimeField.text ?? "", timeFirstField.text ?? "00:00", checkBoxButton.isSelected)
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

    func setupDatePicker() {
        timeFirstField.tintColor = UIColor.white
        pickerFirst.datePickerMode = .time
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = Colors.appTheme
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel".localized, style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        timeFirstField.inputView = pickerFirst
        timeFirstField.inputAccessoryView = toolBar
    }
    
    @objc func doneClick() {
        timeFirstField.resignFirstResponder()
        selectedDate = pickerFirst.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        timeFirstField.text = dateFormatter.string(from: selectedDate ?? Date())
    }
    
    @objc func cancelClick() {
        timeFirstField.resignFirstResponder()
    }
    
    // MARK: - setup
    
    init() {
        super.init(frame: .zero)
        setupUI()
        
        nameField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)),for: UIControl.Event.editingDidEnd)
        timeToTimeField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)),for: UIControl.Event.editingDidEnd)
        
        
        setupDatePicker()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error, not implemented")
    }
    // MARK: - private functions
    
    private func setupUI() {
        self.backgroundColor = Colors.white
        
        addSubview(addPrescriptionText)
        addSubview(nameText)
        addSubview(nameField)
        addSubview(timeToTimeText)
        addSubview(timeToTimeField)
        addSubview(timeFirstText)
        addSubview(takeNow)
        addSubview(checkBoxButton)
        addSubview(timeFirstField)
        addSubview(tipText)
        addSubview(includeButton)
        
        setupConstraints()
        
    }
    private func setupConstraints() {
        setTexts(to: addPrescriptionText)
        setTexts(to: tipText)
        setField(to: nameText, elementField: nameField, inside: nameText)
        setField(to: timeToTimeText, elementField: timeToTimeField, inside: timeToTimeText)
        setField(to: timeFirstText, elementField: timeFirstField, inside: timeFirstText)
        setButton(to: includeButton)
        
        addPrescriptionText.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.large).isActive = true
        nameText.topAnchor.constraint(equalTo: addPrescriptionText.bottomAnchor, constant: Metrics.Spacing.greater).isActive = true
        nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        
        timeToTimeText.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: Metrics.Spacing.large).isActive = true
        timeFirstText.topAnchor.constraint(equalTo: timeToTimeField.bottomAnchor, constant: Metrics.Spacing.large).isActive = true
        timeFirstField.trailingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor, constant: -Metrics.Spacing.eighten).isActive = true
        
        takeNow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.Spacing.small).isActive = true
        takeNow.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: Metrics.Spacing.small).isActive = true
        takeNow.topAnchor.constraint(equalTo: checkBoxButton.topAnchor, constant: Metrics.Spacing.small).isActive = true
        
        checkBoxButton.leadingAnchor.constraint(equalTo: timeFirstText.trailingAnchor, constant: Metrics.Spacing.tiny).isActive = true
        checkBoxButton.topAnchor.constraint(equalTo: timeFirstField.topAnchor, constant: -Metrics.Spacing.smallIsh).isActive = true
        
        tipText.bottomAnchor.constraint(equalTo: includeButton.topAnchor, constant: -Metrics.Spacing.greater).isActive = true
    }
    
    private func setField(to elementText: UIView, elementField: UIView, inside off: UIView) {
        elementText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        elementField.topAnchor.constraint(equalTo: off.bottomAnchor, constant: Metrics.Spacing.medium).isActive = true
        elementField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
    }
    
    private func setButton(to element: UIView) {
        element.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.large).isActive = true
        element.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        element.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        
    }
    
    private func setTexts(to element: UIView) {
        element.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        element.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true    }
    
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
