//
//  customTableViewCell.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 31.05.2022.

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "CustomTableViewCell"


    // MARK: - Set icon symbols view

    let iconView: UIImageView = {
        let icon = UIImageView(frame: CGRect(x: 4,
                                             y: 5,
                                             width: Metric.customCelliConSymbolSize,
                                             height: Metric.defaultCelliConSymbolSize))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .white
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

    // MARK: - Set badge
    private lazy var badgeButton: UIButton = {
        let badgeButton = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        //       config.title = String(badge)
        config.baseBackgroundColor = .systemRed
        config.buttonSize = .mini
        badgeButton.configuration = config
        return badgeButton
    }()
    
    // MARK: - Setup view
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(colorView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        colorView.addSubview(iconView)
    }

    // MARK: - Setup layout
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

    // MARK: - Configure cell
    func configure(with model: Cell) {

        colorView.backgroundColor = model.iconColor

        titleLabel.text = model.title
        if let detailText = model.detail {
            detailLabel.text = detailText
        }

        if model.isCustomCell != nil {
            iconView.image = UIImage(named: model.image)
        } else {

            iconView.image = UIImage(systemName: model.image)
        }

        if let badge = model.badge {
            badgeButton.setTitle(String(badge), for: .normal)
            contentView.addSubview(badgeButton)
            badgeButton.translatesAutoresizingMaskIntoConstraints = false
            badgeButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
            badgeButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        }
    }

    // MARK: - Prepare for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .disclosureIndicator

        detailLabel.text = nil
        badgeButton.removeFromSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
