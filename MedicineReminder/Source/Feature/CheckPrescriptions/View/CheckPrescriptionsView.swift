//
//  CheckPrescriptionsView.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CheckPrescriptionsView: UIView, CheckPrescriptionsViewProtocol {
    var prescriptions:[Prescription] = []
    var db:DBHelper = DBHelper()
    
    // MARK: - variables
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.layer.masksToBounds = true
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return table
    }()
    
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
        addSubview(tableView)
        prescriptions = db.read()
        tableView.reloadData()
        setupConstraints()
    }
    private func setupConstraints() {
        tableView.bindFrameToSuperviewBounds()
        
    }
    
}

extension CheckPrescriptionsView: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let identifier = "CustomCell"
        var cell: CustomCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomCell
        if cell == nil {
            tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomCell
        }
        cell.nameField.text = "\(prescriptions[indexPath.row].name)"
        cell.timeToTimeField.text = "\(prescriptions[indexPath.row].timeToTime)"
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrics.Spacing.greater
    }
    
}
