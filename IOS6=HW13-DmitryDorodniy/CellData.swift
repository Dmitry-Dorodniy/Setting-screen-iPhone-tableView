//
//  CellData.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import Foundation
import UIKit

struct Cell {
    var image: String
    var iconColor: UIColor = .systemBlue
    var title: String
    var detail: String?
    var badge: Int?
    var isToggle: Bool?
    var isCustomCell: Bool?
}

// MARK: - Values to setting

enum Metric {
    static let defaultCellReuseIdentifier: String = "DefaulTableViewCell"
//    static let reuseIdentifier: String = "CustomTableViewCell"
    static let navigationTitle: String = "Настройки"
    static let iconColorViewSize: CGFloat = 30
    static let iconColorViewCornerRadius: CGFloat = 6
    static let defaultCelliConSymbolSize: CGFloat = 21
    static let customCelliConSymbolSize: CGFloat = 22
}
