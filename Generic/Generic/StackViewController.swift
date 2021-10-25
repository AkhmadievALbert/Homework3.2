//
//  StackViewController.swift
//  Generic
//
//  Created by a.akhmadiev on 25.10.2021.
//

import UIKit

final class StackViewController: UIViewController {

    // MARK: Private properties

    weak var delegate: StackViewControllerDelegate?


    // MARK: Private properties

    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present new view", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentNewViewTapped), for: .touchUpInside)
        return button
    }()

    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss me", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissMeTapped), for: .touchUpInside)
        return button
    }()

    private let dismissAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss All", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissAllTapped), for: .touchUpInside)
        return button
    }()

    private let fastDismissAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fast dismiss ALL", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(fastDismissAllTapped), for: .touchUpInside)
        return button
    }()


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    // MARK: Private

    private func setupView() {
        isModalInPresentation = true
        view.addSubview(addButton)
        view.addSubview(dismissButton)
        view.addSubview(dismissAllButton)
        view.addSubview(fastDismissAllButton)

        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -48).isActive = true

        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true

        dismissAllButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissAllButton.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 8).isActive = true

        fastDismissAllButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fastDismissAllButton.topAnchor.constraint(equalTo: dismissAllButton.bottomAnchor, constant: 8).isActive = true
    }

    @objc private func presentNewViewTapped() {
        delegate?.presentNewView()
    }

    @objc private func dismissMeTapped() {
        delegate?.dismiss()
    }

    @objc private func dismissAllTapped() {
        delegate?.dissmissAll()
    }

    @objc private func fastDismissAllTapped() {
        delegate?.fastDissmiss()
    }
}
