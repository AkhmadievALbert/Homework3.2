//
//  ViewController.swift
//  Generic
//
//  Created by a.akhmadiev on 25.10.2021.
//

import UIKit

protocol StackViewControllerDelegate: AnyObject {
    func presentNewView()
    func dismiss()
    func dissmissAll()
    func fastDissmiss()
}

class ViewController: UIViewController {

    private let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Stack", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(newViewTapped), for: .touchUpInside)
        return button
    }()

    private var stack = Stack<UIViewController>()

    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
        setupView()
    }


    // MARK: Private

    private func setupView() {
        stack.push(self)
        view.addSubview(createButton)
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func buildView() {
        let factory = AnyFactory(factory: ViewFactory())
        let view = factory.build(with: ViewContext(color: .red))
        self.view = view
    }

    @objc private func newViewTapped() {
        presentNewView()
    }
}


// MARK: - StackViewControllerDelegate

extension ViewController: StackViewControllerDelegate {

    func presentNewView() {
        let newView = StackViewController()
        newView.delegate = self
        stack.push(newView, animated: true)
    }

    func dismiss() {
        stack.pop(animated: true)
    }

    func dissmissAll() {
        stack.dismissAll()
        stack.push(self)
    }

    func fastDissmiss() {
        stack.fastDismiss()
        stack.push(self)
    }
}
