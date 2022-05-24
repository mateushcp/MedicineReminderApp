//
//  Strings+Ext.swift
//  daHora
//
//  Created by Mateus Henrique Coelho de Paulo on 10/02/22.
//

import Foundation

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
