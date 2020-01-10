//
//  AppViewController.swift
//  UIFlexViewSwiftDemo
//
//  Created by Alex on 07/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

import UIKit
import UIFlexView

class AppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let flexView = UIFlexView()
        view.addSubview(flexView)
        flexView.translatesAutoresizingMaskIntoConstraints = false
        flexView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            flexView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            flexView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            flexView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            flexView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
