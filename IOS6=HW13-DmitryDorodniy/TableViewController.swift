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
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
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
        let cellDataIndex = allCellData[indexPath.section][indexPath.row]

        // MARK: - Set custom cell table

            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier,
                                                          for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

            cell.configure(with: cellDataIndex)
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

