//
//  CustomCell.swift
//  MedicineReminder
//
//  Created by Mateus Henrique Coelho de Paulo on 06/02/22.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    private lazy var cellIcon: UIImageView = {
        let variable = UIImageView(image: UIImage.hearthIcon)
        variable.contentMode = .scaleAspectFit
        variable.clipsToBounds = true
        variable.isUserInteractionEnabled = false
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    lazy var nameField: UILabel = {
        let variable = UILabel()
        variable.textColor = Colors.appTheme
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.textAlignment = NSTextAlignment.center
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    lazy var timeToTimeField: PaddingLabel = {
        let variable = PaddingLabel(withInsets: Metrics.Spacing.nano,
                                    Metrics.Spacing.nano,
                                    Metrics.Spacing.small,
                                    Metrics.Spacing.small)
        
        variable.textColor = Colors.white
        variable.textAlignment = NSTextAlignment.center
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.font = UIFont(name: "ArialNarrow", size: Metrics.Spacing.huge)
        variable.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.backgroundColor = Colors.red
        variable.heightAnchor.constraint(equalToConstant: Metrics.Spacing.huge).isActive = true
        variable.layer.masksToBounds = true
        variable.layer.cornerRadius = Metrics.Spacing.small
        return variable
    }()
    
    lazy var background: UIView = {
        let variable = UIView(frame: CGRect(x: 20, y: 20, width: 480, height: 110))
        variable.layer.masksToBounds = true
        variable.layer.cornerRadius = Metrics.Spacing.medium
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    let deleteButton: UIButton = {
        let variable = UIButton()
        variable.setTitle("Delete_Button".localized, for: .normal)
        variable.setTitleColor(Colors.red, for: .normal)
        variable.titleLabel?.font = UIFont.boldSystemFont(ofSize: Metrics.Spacing.medium)
        variable.translatesAutoresizingMaskIntoConstraints = false
//        variable.addTarget(self, action: #selector(didTapRecomend), for: .touchUpInside)
        return variable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameField.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.contentView.layoutIfNeeded()
        })
    }
    
    private func setupUI(){
        self.backgroundColor = .clear
        addSubview(background)
        background.addSubview(cellIcon)
        background.addSubview(nameField)
        background.addSubview(timeToTimeField)
        background.addSubview(deleteButton)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        background.bindFrameToSuperviewBounds()
        background.applyGradient(isVertical: true, colorArray: [Colors.cellBackGround, Colors.white])
        
        cellIcon.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small).isActive = true
        cellIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large).isActive = true
        cellIcon.heightAnchor.constraint(equalToConstant: Metrics.Spacing.greater).isActive = true
        cellIcon.widthAnchor.constraint(equalToConstant: Metrics.Spacing.large).isActive = true
        
        nameField.leadingAnchor.constraint(equalTo: cellIcon.leadingAnchor, constant: Metrics.Spacing.huge).isActive = true
        nameField.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: Metrics.Spacing.greater).isActive = true
        
        timeToTimeField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium).isActive = true
        timeToTimeField.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small).isActive = true
        timeToTimeField.heightAnchor.constraint(equalToConstant: Metrics.Spacing.greater).isActive = true
        
        deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        deleteButton.topAnchor.constraint(equalTo: nameField.topAnchor, constant: Metrics.Spacing.large).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: Metrics.Spacing.greatest).isActive = true
        
    }
}

extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1.5) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
