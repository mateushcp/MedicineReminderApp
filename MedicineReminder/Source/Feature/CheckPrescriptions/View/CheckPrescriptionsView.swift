//
//  CheckPrescriptionsView.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CheckPrescriptionsView: UIView, CheckPrescriptionsViewProtocol {
    var prescriptions = [Prescription]()
       var db = DBHelper()
    
    // MARK: - variables
    
    private lazy var descriptionText: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.attributedText = "Check_Text".localized.attributedStringWithColor(["Remover lembrete"], color: Colors.red)
        variable.numberOfLines = zeroRawValue
        variable.textAlignment = .center
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.layer.masksToBounds = true
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return table
    }()
    
    private let zeroRawValue = 0
    var selectedIndex = IndexPath(row: 0, section: 0)

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
        addSubview(descriptionText)
        addSubview(tableView)
        prescriptions = db.read()
        tableView.reloadData()
        setupConstraints()
    }
    private func setupConstraints() {
        
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.large).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        descriptionText.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: Metrics.Spacing.medium).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.greatest).isActive = true


    }
    
    @objc func didTapDelete(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else {
            return
        }
        prescriptions.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        tableView.endUpdates()
        
//        didDeleteData(selectedIndex)
    }
    
}

extension CheckPrescriptionsView: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prescriptions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell ?? CustomCell()
             let prescription = prescriptions[indexPath.row]

             cell.nameField.text = "\(prescription.name)"
        cell.timeToTimeField.text = "\(prescription.timeToTime)"
        cell.selectionStyle = .none
        cell.animate()
        cell.deleteButton.addTarget(self, action: #selector(didTapDelete(_:)), for: .touchUpInside)
        cell.contentView.isUserInteractionEnabled = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        tableView.beginUpdates()
        tableView.reloadRows(at: [selectedIndex], with: .none)
        tableView.endUpdates()
            
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat { (selectedIndex == indexPath) ? Metrics.Spacing.expand : Metrics.Spacing.eighten
    }
    
}
