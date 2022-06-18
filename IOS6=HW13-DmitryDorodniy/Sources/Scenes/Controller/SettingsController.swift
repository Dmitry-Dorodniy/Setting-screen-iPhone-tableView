//
//  ViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 18.06.2022.
//

import UIKit

class SettingsController: UIViewController {

        private var tableView: SettingsView? {
            guard isViewLoaded else { return nil }
            return view as? SettingsView
        }

        var model: CellApi?

        override func viewDidLoad() {
            super.viewDidLoad()

            view = SettingsView()
            model = CellApi()
            navigationItem.title = Metric.navigationTitle
            
            configureView()
        }
    }

    private extension SettingsController {
        func configureView() {
            guard let models = model?.getData() else { return }
            tableView?.configureView(with: models)
        }
    }


