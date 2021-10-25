//
//  ViewController.swift
//  Generic
//
//  Created by a.akhmadiev on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildView()
    }

    // MARK: Private

    private func buildView() {
        let factory = AnyFactory(factory: ViewFactory())
        let view = factory.build(with: ViewContext(color: .red))
        self.view = view
    }
}

