//
//  ChevronTableViewCell.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 31.05.2022.
//

import UIKit

class ChevronTableViewCell: UITableViewCell {
    static let identifier = "ChevronTableViewCell"

    var cellData: Cell? {
        didSet {
            guard let cellItem = cellData else { return }
            titleLabel.text = cellItem.title
            if let detailText = cellItem.detail {
                detailLabel.text = detailText
            }
            if let icon = cellItem.image {
                iconView.image = UIImage(named: icon)
            }
        }
    }
    let iconView: UIImageView = {
        let icon = UIImageView(frame: CGRect(x: 3, y: 3, width: 19, height: 19))
        icon.contentMode = .scaleAspectFill

        return icon
    }()

    let colorView: UIView = {
        let colorView = UIView()
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = 4
        colorView.backgroundColor = .tintColor

        return colorView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(colorView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        colorView.addSubview(iconView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.rightAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: -15).isActive = true
        colorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 26).isActive = true



        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor, constant: 40).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
