//
//  ViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 18.06.2022.
//

import UIKit

protocol SettingConrollerOutput: AnyObject {
    func pushDetail(with model: Cell)
}

final class SettingsController: UIViewController, SettingConrollerOutput {

        private var settingView: SettingsView? {
            guard isViewLoaded else { return nil }
            return view as? SettingsView
        }

        var model: CellApi?

        override func viewDidLoad() {
            super.viewDidLoad()

            view = SettingsView()
            model = CellApi()
            configureView()
        }
    }

 extension SettingsController {
       private func configureView() {
            guard let models = model?.getData() else { return }
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.title = Metric.navigationTitle
            settingView?.configureView(with: models)
            settingView?.delegate = self
        }

     func pushDetail(with model: Cell) {
            let detailViewController = DetailViewController()
         detailViewController.model = model
         present(detailViewController, animated: true)
        }
    }


