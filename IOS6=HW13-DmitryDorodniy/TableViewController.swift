//
//  TableViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import UIKit

class TableViewController: UIViewController {

    //    создаём свойство класса с таблицей
    private lazy var tableView: UITableView = {
        //        таблица с закруглёнными краями групп
        let table = UITableView(frame: view.bounds, style: .insetGrouped)

        table.dataSource = self
        table.delegate = self
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings
    private func setupView() {

        view.backgroundColor = .systemBackground
        navigationItem.title = "Настройки"
        //        регистрируем таблицу
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Metric.reuseString)
    }

    private func setupHierarchy() {

        view.addSubview(tableView)
    }

    private func setupLayout() {

        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

// MARK: - Table extentions
extension TableViewController: UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allCellData.count //число секций
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCellData[section].count //задаём число элементов в каждой секции
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //стиль ячейки таблицы
        let cell = UITableViewCell(style: .value1, reuseIdentifier: Metric.reuseString)
        // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //стиль контента в ячейках
        var content = cell.defaultContentConfiguration()

        cell.accessoryType = .disclosureIndicator
        //текст тайтла и описания
        content.image = UIImage(systemName: "play")
        content.imageProperties.tintColor = .systemOrange
 
        content.imageToTextPadding = 3
        content.text = allCellData[indexPath.section][indexPath.row].title ?? ""
        content.secondaryText = allCellData[indexPath.section][indexPath.row].detail ?? ""

        cell.contentConfiguration = content

        //switch button
        let switchButton = UISwitch(frame: .zero)
        if allCellData[indexPath.section][indexPath.row].isToggle != nil {
            cell.accessoryView = switchButton
        }

        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = allCellData[indexPath.section][indexPath.row].title ?? "nil"
        print("\(title) cell pressed")
    }
}


