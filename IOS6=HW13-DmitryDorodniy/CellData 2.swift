//
//  CellData.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import Foundation
import UIKit

struct Cell {
    var image: String?
    var iconColor: UIColor = .systemBlue
    var title: String
    var detail: String?
    var badge: Int?
    var isToggle: Bool?
    var isCustomCell: Bool?
}

// MARK: - Get data method

class CellApi {
    static func getData() -> [[Cell]] {
        let section1 = [Cell(image: "airplane",
                             iconColor: .systemOrange,
                             title: "Авиарежим",
                             isToggle: true),
                        Cell(image: "wifi",
                             title: "Wi-Fi",
                             detail: "Не подключено"),
                        Cell(image: "bluetooth",
                             title: "Bluetooth",
                             detail: "Вкл.",
                             isCustomCell: true),
                        Cell(image: "antenna.radiowaves.left.and.right",
                             iconColor: .systemGreen,
                             title: "Сотовая связь"),
                        Cell(image: "personalhotspot",
                             iconColor: .systemGreen,
                             title: "Режим модема",
                             detail: "Выкл."),
                        Cell(image: "vpn",
                             title: "VPN",
                             isToggle: true,
                             isCustomCell: true)]

        let section2 = [Cell(image: "bell.badge.fill",
                             iconColor: .systemRed,
                             title: "Уведомления"),
                        Cell(image: "speaker.wave.3.fill",
                             iconColor: .systemRed,
                             title: "Звуки, тактильные сигналы"),
                        Cell(image: "moon.fill",
                             iconColor: .systemIndigo,
                             title: "Не беспокоить"),
                        Cell(image: "hourglass",
                             iconColor: .systemIndigo,
                             title: "Экранное время")]

        let section3 = [Cell(image: "gear",
                             iconColor: .systemGray,
                             title: "Основные",
                             badge: 1),
                        Cell(image: "switch.2",
                             iconColor: .systemGray,
                             title: "Пункт управления"),
                        Cell(image: "textformat.size",
                             title: "Экран и яркость"),
                        Cell(image: "homescreen",
                             iconColor: .systemBlue,
                             title: "Экран \u{00AB}Домой\u{00BB}",
                             isCustomCell: true),
                        Cell(image: "accessibility",
                             title: "Универсальный доступ",
                             isCustomCell: true)]

        return [section1, section2, section3]
    }
}

// MARK: - Values to setting

enum Metric {
    static let defaultCellReuseIdentifier: String = "DefaulTableViewCell"
    static let customCellReuseIdentifier: String = "CustomTableViewCell"
    static let navigationTitle: String = "Настройки"
    static let iconColorViewSize: CGFloat = 30
    static let iconColorViewCornerRadius: CGFloat = 6
    static let defaultCelliConSymbolSize: CGFloat = 21
    static let customCelliConSymbolSize: CGFloat = 22
}
