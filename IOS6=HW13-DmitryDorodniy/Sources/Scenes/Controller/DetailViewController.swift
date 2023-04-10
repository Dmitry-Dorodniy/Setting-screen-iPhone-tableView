//
//  DetailViewController.swift
//  IOS6=HW13-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 08.04.2023.
//

import UIKit

final class DetailViewController: UIViewController {

    var model: Cell? {
        didSet {
            if model?.isCustomCell != nil, let image = model?.image {
                iconImage.image = UIImage(named: image)
            } else if let image = model?.image {
                iconImage.image = UIImage(systemName: image)
            }
            iconImage.backgroundColor = model?.iconColor
            cellLabel.text = model?.title
        }
    }

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground.withAlphaComponent(0.9)
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(iconImage)
        view.addSubview(cellLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 300),
            iconImage.heightAnchor.constraint(equalToConstant: 300),

            cellLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 30),
            cellLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cellLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cellLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
