//
//  Box.swift
//  UIFlexViewSwiftDemo
//
//  Created by Alex on 11/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

import UIKit

class Box: UIView {
    private let label = UILabel()
    
    var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    static func with(label: String) -> Box {
        let box = Box()
        box.labelText = label
        return box
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1.0 / UIScreen.main.scale
        layer.borderColor = UIColor.black.cgColor
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 100),
            label.widthAnchor.constraint(equalToConstant: 100),

            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
