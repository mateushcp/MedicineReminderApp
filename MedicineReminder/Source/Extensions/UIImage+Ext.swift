//
//  UIImage+Ext.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 03/02/22.
//

import Foundation
import UIKit

extension UIView {

    public static func withHeight(_ height: CGFloat) -> UIView {
        let view = UIView()
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height)
        ])
        return view
    }
    public static func withWidth(_ width: CGFloat) -> UIView {
        let view = UIView()
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: width)
        ])
        return view
    }
}
