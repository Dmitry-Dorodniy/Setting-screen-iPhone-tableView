//
//  TableView.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 18.06.2022.
//

import UIKit

final class SettingsView: UIView {

    weak var delegate: SettingConrollerOutput?
    
    // MARK: - Configure view

    func configureView(with models: [[Cell]]) {
        self.models = models
        tableView.reloadData()
    }

    private var models = [[Cell]]()

    // MARK: - View

    private lazy var tableView: UITableView = {
        // таблица с закруглёнными краями групп
        let table = UITableView(frame: self.bounds,
                                style: .insetGrouped)
        table.dataSource = self
        table.delegate = self
        table.register(SettingsTableViewCell.self,
                           forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
        return table
    }()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings of table

    private func setupView() {
        self.backgroundColor = .systemBackground
    }

    private func setupHierarchy() {
        self.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension SettingsView: UITableViewDataSource  {

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count //число секций
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count //задаём число элементов в каждой секции
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDataIndex = models[indexPath.section][indexPath.row]

        // MARK: - Set custom cell table

        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }

        cell.configure(with: cellDataIndex)
        return cell
    }
}

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section][indexPath.row]
        print("Выбрана ячейка \(model.title)")
        
        switch model.title {
        case "Авиарежим", "VPN":
            break
        default:
            delegate?.pushDetail(with: model)
        }
        
//        delegate?.pushDetail(with: model)
    }
}


