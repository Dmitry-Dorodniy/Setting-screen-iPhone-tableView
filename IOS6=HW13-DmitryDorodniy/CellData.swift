//
//  CellData.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import Foundation

struct Cell {
    var title: String?
    var detail: String?
    var isToggle: Bool?
}


class CellApi {
    static func getData() -> [[Cell]] {
        let section1 = [Cell(title: "Авиарежим", isToggle: true),
                        Cell(title: "Wi-Fi", detail: "Не подключено"),
                        Cell(title: "Bluetooth", detail: "Вкл."),
                        Cell(title: "Сотовая связь"),
                        Cell(title: "Режим модема"),
            Cell(title: "VPN", isToggle: true)]

        let section2 = [Cell(title: "Уведомления"),
                        Cell(title: "Звуки, тактильные сигналы"),
                        Cell(title: "Не беспокоить"),
                        Cell(title: "Экранное время")]

        let section3 = [Cell(title: "Основные"),
                        Cell(title: "Пункт управления"),
                        Cell(title: "Экран и яркость"),
                        Cell(title: "Экран \(#"Домой"#)"),
                        Cell(title: "Универсальный доступ")]

        return [section1, section2, section3]
    }

}

var allCellData = CellApi.getData()

