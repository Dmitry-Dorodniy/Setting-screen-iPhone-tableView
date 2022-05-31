//
//  TableViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import UIKit

class TableViewController: UIViewController {

    private let allCellData = CellApi.getData()

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
        tableView.register(ChevronTableViewCell.self, forCellReuseIdentifier: ChevronTableViewCell.identifier)
    }

    private func setupHierarchy() {

        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    @objc func didChangeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("Turn ON")
        } else {
            print("Turn OFF")
        }
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
        let cellDataIndex = allCellData[indexPath.section][indexPath.row]

        if cellDataIndex.title == "Bluetooth" {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChevronTableViewCell.identifier, for: indexPath) as! ChevronTableViewCell
           cell.accessoryType = .disclosureIndicator
            cell.cellData = cellDataIndex
//            let switchButton = UISwitch(frame: .zero)
//            switchButton.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//            cell.accessoryView = switchButton
            return cell
        }

        //стиль ячейки таблицы
        let cell = UITableViewCell(style: .value1, reuseIdentifier: Metric.reuseString)
        // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //стиль контента в ячейках
        cell.accessoryType = .disclosureIndicator
        //текст тайтла и описания

        let colorView = UIView()
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = 4
        colorView.backgroundColor = cellDataIndex.iconColor ?? .tintColor
        cell.addSubview(colorView)

        var content = cell.defaultContentConfiguration()
        let image = UIImage(systemName: cellDataIndex.image ?? "")
        //        let image = UIImage(systemName: cellDataIndex.image ?? "")

        //        content.imageProperties.cornerRadius = 40
        content.imageProperties.tintColor = .white
        content.imageProperties.maximumSize = CGSize(width: 19, height: 19)
        content.image = image
        content.text = cellDataIndex.title
        content.secondaryText = cellDataIndex.detail ?? ""

        cell.contentConfiguration = content

        //switch button
//        let switchButton = UISwitch(frame: .zero)
        if cellDataIndex.isToggle != nil {
            let switchButton = UISwitch(frame: .zero)
            switchButton.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
            cell.accessoryView = switchButton
        }

        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        colorView.leftAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leftAnchor, constant: -1).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 26).isActive = true

        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = allCellData[indexPath.section][indexPath.row].title
        print("\(title) cell pressed")
    }
}

