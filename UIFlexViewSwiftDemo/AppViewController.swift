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
        
        view.backgroundColor = .darkGray
        
        // Set up flex view
        let flexView = UIFlexView()
        view.addSubview(flexView)
        
        flexView.translatesAutoresizingMaskIntoConstraints = false
        flexView.backgroundColor = .lightGray
        flexView.flexDirection = .row
        flexView.flexWrap = .wrap
        
        NSLayoutConstraint.activate([
            flexView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            flexView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            flexView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            flexView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Set up boxes
        flexView.addSubview(Box.staticallySized(label: "1"))
        flexView.addSubview(Box.staticallySized(label: "2"))
        flexView.addSubview(Box.staticallySized(label: "3"))
        flexView.addSubview(Box.staticallySized(label: "4"))
        flexView.addSubview(Box.staticallySized(label: "5"))
        flexView.addSubview(Box.staticallySized(label: "6"))
        flexView.addSubview(Box.staticallySized(label: "7"))
        flexView.addSubview(Box.staticallySized(label: "8"))
        flexView.addSubview(Box.staticallySized(label: "9"))
        flexView.addSubview(Box.staticallySized(label: "10"))
    }
}
