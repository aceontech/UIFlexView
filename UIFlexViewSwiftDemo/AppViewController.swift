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
        
        flexView.addSubview(Box.dynamicallySized(label: "1"))
        flexView.addSubview(Box.dynamicallySized(label: "2"))
        flexView.addSubview(Box.dynamicallySized(label: "3"))
        flexView.addSubview(Box.dynamicallySized(label: "4"))
        flexView.addSubview(Box.dynamicallySized(label: "5"))
        flexView.addSubview(Box.dynamicallySized(label: "6"))
        flexView.addSubview(Box.dynamicallySized(label: "7"))
        flexView.addSubview(Box.dynamicallySized(label: "8"))
        flexView.addSubview(Box.dynamicallySized(label: "9"))
        flexView.addSubview(Box.dynamicallySized(label: "10"))
        flexView.addSubview(Box.dynamicallySized(label: "11"))
        flexView.addSubview(Box.dynamicallySized(label: "12"))
        flexView.addSubview(Box.dynamicallySized(label: "13"))
        flexView.addSubview(Box.dynamicallySized(label: "14"))
        flexView.addSubview(Box.dynamicallySized(label: "15"))
        flexView.addSubview(Box.dynamicallySized(label: "16"))
        flexView.addSubview(Box.dynamicallySized(label: "17"))
        flexView.addSubview(Box.dynamicallySized(label: "18"))
        flexView.addSubview(Box.dynamicallySized(label: "19"))
        flexView.addSubview(Box.dynamicallySized(label: "20"))
        flexView.addSubview(Box.dynamicallySized(label: "21"))
        flexView.addSubview(Box.dynamicallySized(label: "22"))
        flexView.addSubview(Box.dynamicallySized(label: "23"))
        flexView.addSubview(Box.dynamicallySized(label: "24"))
        flexView.addSubview(Box.dynamicallySized(label: "25"))
        flexView.addSubview(Box.dynamicallySized(label: "26"))
        flexView.addSubview(Box.dynamicallySized(label: "27"))
        flexView.addSubview(Box.dynamicallySized(label: "28"))
        flexView.addSubview(Box.dynamicallySized(label: "29"))
        flexView.addSubview(Box.dynamicallySized(label: "30"))
        flexView.addSubview(Box.dynamicallySized(label: "31"))
        flexView.addSubview(Box.dynamicallySized(label: "32"))
        flexView.addSubview(Box.dynamicallySized(label: "33"))
        flexView.addSubview(Box.dynamicallySized(label: "34"))
        flexView.addSubview(Box.dynamicallySized(label: "35"))
        flexView.addSubview(Box.dynamicallySized(label: "36"))
        flexView.addSubview(Box.dynamicallySized(label: "37"))
        flexView.addSubview(Box.dynamicallySized(label: "38"))
        flexView.addSubview(Box.dynamicallySized(label: "39"))
        flexView.addSubview(Box.dynamicallySized(label: "40"))
    }
}
