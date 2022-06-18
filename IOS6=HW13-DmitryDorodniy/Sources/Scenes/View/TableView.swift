//
//  TableView.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 18.06.2022.
//

import UIKit

class TableView: UIView {

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
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
    }

    private func setupHierarchy() {
        self.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension TableView: UITableViewDataSource  {

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count //число секций
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count //задаём число элементов в каждой секции
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDataIndex = models[indexPath.section][indexPath.row]

        // MARK: - Set custom cell table

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

        cell.configure(with: cellDataIndex)
        return cell
    }
}

extension TableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = models[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title)")
    }
}
