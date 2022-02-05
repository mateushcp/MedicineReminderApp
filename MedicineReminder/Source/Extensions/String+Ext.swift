//
//  String+Ext.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
            let attributedString = NSMutableAttributedString(string: self)
            for string in strings {
                let range = (self as NSString).range(of: string)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            }

            guard let characterSpacing = characterSpacing else {return attributedString}

            attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))

            return attributedString
        }
}
