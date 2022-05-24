//
//  UIImage+ImageSources.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/02/22.
//

import Foundation
import UIKit

extension UIImage{
    
    class func setRenderingIcon(image: UIImage) -> UIImage {
        image.withRenderingMode(.alwaysTemplate)
    }

    class var iconImage: UIImage{
        guard let image = UIImage(named: "medicineReminder") else {return #imageLiteral(resourceName: "medicineReminder") }
        return image
    }
    
    class var newPrescriptionIcon: UIImage{
        return setRenderingIcon(image: UIImage(named: "newPrescription") ?? #imageLiteral(resourceName: "newPrescription"))
    }
    
    class var checkPrescriptionsIcon: UIImage{
        return setRenderingIcon(image: UIImage(named: "checkPrescriptions") ?? #imageLiteral(resourceName: "checkPrescriptions"))
    }
    
    class var hearthIcon: UIImage{
        return setRenderingIcon(image: UIImage(named: "hearth") ?? #imageLiteral(resourceName: "hearth"))
    }
    
    class var backButton: UIImage{
        return setRenderingIcon(image: UIImage(named: "backButton") ?? #imageLiteral(resourceName: "backButton"))
    }
    
    class var addNew: UIImage{
        return setRenderingIcon(image: UIImage(named: "addNew") ?? #imageLiteral(resourceName: "backButton"))
    }
    
    class var markedCheckbox: UIImage{
        return setRenderingIcon(image: UIImage(named: "check-box") ?? #imageLiteral(resourceName: "check-box"))
    }
    
    class var unmarkedCheckbox: UIImage{
        return setRenderingIcon(image: UIImage(named: "blank-check-box") ?? #imageLiteral(resourceName: "blank-check-box"))
    }
}
