//
//  ChevronTableViewCell.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 31.05.2022.
//

import UIKit

class ChevronTableViewCell: UITableViewCell {
static let identifier = "ChevronTableViewCell"

    let label: UILabel = {
        let label = UILabel()
        label.text = "Ghbdtn"
        return label
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        label.frame = CGRect(x: 100, y: 0, width: 100, height: contentView.frame.size.height - 3)
    }
}
