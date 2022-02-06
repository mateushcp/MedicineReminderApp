//
//  Prescription.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 05/02/22.
//

import Foundation

struct Prescription {
    
    var name: String = ""
    var timeToTime: String = ""
    var id: Int? = 0
    
    init(name : String , timeToTime : String ,id:Int) {
            self.name = name
            self.timeToTime = timeToTime
            self.id = id
        }
    }

