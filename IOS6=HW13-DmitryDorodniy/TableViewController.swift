//
//  TableViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 30.05.2022.
//

import UIKit

class TableViewController: UIViewController {

    private lazy var topLabel: UILabel = {

        let label = UILabel()

        label.text = "Настройки"
        label.backgroundColor = .systemFill
        return label
    }()

    //    создаём свойство класса с таблицей
    private lazy var tableView: UITableView = {
        //        таблица с закруглёнными краями групп
        let table = UITableView(frame: .zero, style: .insetGrouped)

        table.dataSource = self
        table.delegate = self
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayout()

    }

    private func setupView() {

        view.backgroundColor = .systemBackground

        //        регистрируем таблицу
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func setupHierarchy() {

        view.addSubview(tableView)
    }

    private func setupLayout() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension TableViewController: UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allCellData.count //число секций
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCellData[section].count //задаём число элементов в каждой секции
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //стиль ячейки таблицы
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        //       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //стиль контента в ячейках
        var content = cell.defaultContentConfiguration()

        cell.accessoryType = .disclosureIndicator
        //текст тайтла и описания
        content.text = allCellData[indexPath.section][indexPath.row].title ?? ""
        content.secondaryText = allCellData[indexPath.section][indexPath.row].detail ?? ""

//        //определяем тип ячейка для установки системного значка
//        if allCellData[indexPath.section][indexPath.row].discl != nil {
//            cell.accessoryType = .disclosureIndicator
//        }
        cell.contentConfiguration = content

        //        cell.textLabel?.text = allCellData[indexPath.section][indexPath.row].title
        //        cell.detailTextLabel?.text = allCellData[indexPath.section][indexPath.row].detail

        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(allCellData[indexPath.section][indexPath.row].detail ?? "nil")
    }
}
