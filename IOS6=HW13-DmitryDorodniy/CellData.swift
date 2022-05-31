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
    var iconColor: UIColor?
    var title: String
    var detail: String?
    var isToggle: Bool?
}


class CellApi {
    static func getData() -> [[Cell]] {
        let section1 = [Cell(image: "airplane", iconColor: .systemOrange, title: "Авиарежим", isToggle: true),
                        Cell(image: "wifi", title: "Wi-Fi", detail: "Не подключено"),
                        Cell(image: "bluetooth", title: "Bluetooth", detail: "Вкл."),
                        Cell(image: "antenna.radiowaves.left.and.right", iconColor: .systemGreen, title: "Сотовая связь"),
                        Cell(image: "personalhotspot", title: "Режим модема", detail: "Выкл."),
                        Cell(image: "wifi.square.fill", title: "VPN", isToggle: true)]

        let section2 = [Cell(image: "bell.badge.fill", iconColor: .systemRed, title: "Уведомления"),
                        Cell(image: "speaker.wave.3.fill", iconColor: .systemRed, title: "Звуки, тактильные сигналы"),
                        Cell(image: "moon.fill", iconColor: .systemIndigo, title: "Не беспокоить"),
                        Cell(image: "hourglass", iconColor: .systemIndigo, title: "Экранное время")]

        let section3 = [Cell(image: "gear", iconColor: .systemGray, title: "Основные"),
                        Cell(image: "switch.2", iconColor: .systemGray, title: "Пункт управления"),
                        Cell(image: "textformat.size", title: "Экран и яркость"),
                        Cell(title: "Экран \u{00AB}Домой\u{00BB}"),
                        Cell(image: "figure.wave.circle", title: "Универсальный доступ")]

        return [section1, section2, section3]
    }

}

var allCellData = CellApi.getData()

enum Metric {
    static let reuseString: String = "cell"

}
