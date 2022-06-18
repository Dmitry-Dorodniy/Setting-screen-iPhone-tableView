//
//  GetCellData.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 14.06.2022.
//

import UIKit

class CellApi {
    func getData() -> [[Cell]] {
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

