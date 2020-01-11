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
    private let fixedSize: CGSize?
    
    var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    
    override init(frame: CGRect) {
        fixedSize = nil
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fixedSize = nil
        super.init(coder: coder)
        setup()
    }
    
    init(fixedSize: CGSize) {
        self.fixedSize = fixedSize
        super.init(frame: .zero)
        setup()
    }
    
    static func staticallySized(_ size: CGSize = CGSize(width: 100, height: 100), label: String) -> Box {
        let box = Box(fixedSize: size)
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
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        if let fixedSize = self.fixedSize {
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalToConstant: fixedSize.height),
                label.widthAnchor.constraint(equalToConstant: fixedSize.width),
            ])
        }
    }
}
