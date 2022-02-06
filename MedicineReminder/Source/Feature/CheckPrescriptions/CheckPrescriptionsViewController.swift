//
//  CheckPrescriptionsViewController.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CheckPrescriptionsViewController: UIViewController {
    var personTableView = UITableView()
    var prescriptions:[Prescription] = []
    var db:DBHelper = DBHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindFrameToSuperviewBounds()
        view.backgroundColor = .white
        
        self.navigationController?.isNavigationBarHidden = false

    }
    
}
