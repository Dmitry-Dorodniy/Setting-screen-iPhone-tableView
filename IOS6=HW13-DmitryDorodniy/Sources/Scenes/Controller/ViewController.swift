//
//  ViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {

        private var tableView: TableView? {
            guard isViewLoaded else { return nil }
            return view as? TableView
        }

        var model: CellApi?

        override func viewDidLoad() {
            super.viewDidLoad()

            view = TableView()
            model = CellApi()
            navigationItem.title = Metric.navigationTitle
            configureView()
        }
    }

    private extension ViewController {
        func configureView() {
            guard let models = model?.getData() else { return }
            tableView?.configureView(with: models)
        }
    }


