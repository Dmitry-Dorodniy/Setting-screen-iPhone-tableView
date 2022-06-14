//
//  DefaultTableViewCell.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 14.06.2022.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
    static let defaultCellReuseIdentifier: String = "DefaulTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
 let colorView = UIView()
//    let badgeButton = UIButton(type: .custom)

    func configure(with model: Cell) {

        // MARK: - Set color icon background
//        let colorView = UIView()
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = Metric.iconColorViewCornerRadius
        colorView.backgroundColor = model.iconColor
        self.addSubview(colorView)
        setupLayout()

   
        // MARK: - Set default cell content
        var content = self.defaultContentConfiguration()
        let image = UIImage(systemName: model.image)

        content.imageProperties.tintColor = .white
        content.imageProperties.maximumSize = CGSize(width: Metric.defaultCelliConSymbolSize,
                                                     height: Metric.defaultCelliConSymbolSize)
        content.image = image
        content.text = model.title
        content.secondaryText = model.detail ?? ""
        self.contentConfiguration = content

        // MARK: - Set Badge

        if let badge = model.badge {
           let badgeButton = UIButton(type: .custom)
//            UIView.performWithoutAnimation {
////                badgeButton.setTitle(, for: .normal)
//                badgeButton.layoutIfNeeded()
//            }
            var config = UIButton.Configuration.filled()
            config.title = String(badge)
            config.baseBackgroundColor = .systemRed
            config.buttonSize = .mini
            badgeButton.configuration = config

           self.addSubview(badgeButton)
            badgeButton.translatesAutoresizingMaskIntoConstraints = false
            badgeButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
            badgeButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        }

        
//        setupLayout()

    }

    // MARK: - Setup layout

    private func setupLayout() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        colorView.leftAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leftAnchor, constant: -3).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: Metric.iconColorViewSize).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: Metric.iconColorViewSize).isActive = true
    }

   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
