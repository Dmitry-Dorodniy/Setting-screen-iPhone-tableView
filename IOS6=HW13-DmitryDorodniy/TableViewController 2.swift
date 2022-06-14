//
//  TableViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import UIKit

class TableViewController: UIViewController {

    private let allCellData = CellApi.getData()

    private lazy var tableView: UITableView = {
        // таблица с закруглёнными краями групп
        let table = UITableView(frame: view.bounds,
                                style: .insetGrouped)
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

    // MARK: - Settings of table
    private func setupView() {

        view.backgroundColor = .systemBackground
        navigationItem.title = Metric.navigationTitle
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Metric.defaultCellReuseIdentifier)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: Metric.customCellReuseIdentifier)
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

        // MARK: - Set custom cell table

        if cellDataIndex.isCustomCell != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: Metric.customCellReuseIdentifier,
                                                     for: indexPath) as! CustomTableViewCell

            cell.accessoryType = .disclosureIndicator
            cell.cellData = cellDataIndex

            if cellDataIndex.isToggle != nil {
                let switchButton = UISwitch(frame: .zero)
                switchButton.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
                cell.accessoryView = switchButton
            }
            return cell
        }

        // MARK: - Set default cell table

        let cell = UITableViewCell(style: .value1,
                                   reuseIdentifier: Metric.defaultCellReuseIdentifier)
        //стиль контента в ячейках
        cell.accessoryType = .disclosureIndicator

        // MARK: - Set icon color frame

        let colorView = UIView()
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = Metric.iconColorViewCornerRadius
        colorView.backgroundColor = cellDataIndex.iconColor
        cell.addSubview(colorView)

        // MARK: - Set default cell content
        var content = cell.defaultContentConfiguration()
        let image = UIImage(systemName: cellDataIndex.image ?? "")

        content.imageProperties.tintColor = .white
        content.imageProperties.maximumSize = CGSize(width: Metric.defaultCelliConSymbolSize,
                                                     height: Metric.defaultCelliConSymbolSize)
        content.image = image
        content.text = cellDataIndex.title
        content.secondaryText = cellDataIndex.detail ?? ""

        cell.contentConfiguration = content

        // MARK: - Set switch button

        if cellDataIndex.isToggle != nil {
            let switchButton = UISwitch(frame: .zero)
            switchButton.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
            cell.accessoryView = switchButton
        }

        // MARK: - Set Badge

        if let badge = cellDataIndex.badge {
            let badgeButton = UIButton(type: .system)
//            UIView.performWithoutAnimation {
//                badgeButton.setTitle(title, for: .normal)
//                badgeButton.layoutIfNeeded()
//            }
            var config = UIButton.Configuration.filled()
            config.title = String(badge)
            config.baseBackgroundColor = .systemRed
            config.buttonSize = .mini
            badgeButton.configuration = config

            cell.addSubview(badgeButton)
            badgeButton.translatesAutoresizingMaskIntoConstraints = false
            badgeButton.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor, constant: -8).isActive = true
            badgeButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        }

        // MARK: - Setup layout

        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        colorView.leftAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leftAnchor, constant: -3).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: Metric.iconColorViewSize).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: Metric.iconColorViewSize).isActive = true

        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = allCellData[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title)")
    }
}

