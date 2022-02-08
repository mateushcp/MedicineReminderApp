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
    var id: Int = 0
    var firstTime: String = ""
    
    init(name : String , timeToTime : String , id:Int, firstTime: String) {
        self.name = name
        self.timeToTime = timeToTime
        self.id = id
        self.firstTime = firstTime
    }
}

