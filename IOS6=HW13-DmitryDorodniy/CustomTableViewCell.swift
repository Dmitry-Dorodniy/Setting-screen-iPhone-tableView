//
//  customTableViewCell.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 31.05.2022.

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let customCellReuseIdentifier: String = "CustomTableViewCell"
    //доступ к данным cellData
//    var cellData: Cell? {
//        didSet {
//            guard let cellItem = cellData else { return }
//            titleLabel.text = cellItem.title
//            if let detailText = cellItem.detail {
//                detailLabel.text = detailText
//            }
//
//            if let icon = cellItem.image {
//                iconView.image = UIImage(named: icon)
//            }
//
//            colorView.backgroundColor = cellItem.iconColor
//        }
//    }

    func configure(with model: Cell) {
//        guard let cellItem = model else { return }
        titleLabel.text = model.title
        if let detailText = model.detail {
            detailLabel.text = detailText
        }

        if let icon = model.image {
            iconView.image = UIImage(named: icon)
        }

        colorView.backgroundColor = model.iconColor
    }

    // MARK: - Set icon symbols view

    let iconView: UIImageView = {
        let icon = UIImageView(frame: CGRect(x: 4,
                                             y: 4,
                                             width: Metric.customCelliConSymbolSize,
                                             height: Metric.defaultCelliConSymbolSize))
        icon.contentMode = .scaleAspectFill

        return icon
    }()

    // MARK: - Set icon color frame
    let colorView: UIView = {
        let colorView = UIView()
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = Metric.iconColorViewCornerRadius

        return colorView
    }()

    // MARK: - Set title and detail of cell
    let titleLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel

        return label
    }()

    // MARK: - Setup view
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
        colorView.rightAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: -13).isActive = true
        colorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: Metric.iconColorViewSize).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: Metric.iconColorViewSize).isActive = true

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
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.accessoryType = .disclosureIndicator
//
//        if (cellData?.detail) != nil {
//            detailLabel.text = cellData?.detail
//        } else {
//            detailLabel.text = nil
//        }
//    }
}
