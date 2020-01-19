//
//  UIFlexViewTests.swift
//  UIFlexViewTests
//
//  Created by Alex on 11/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

import XCTest
import SnapshotTesting
import UIFlexView

class UIFlexViewTests: XCTestCase {

    func testRowWrap() {
        let boxSize = CGSize(width: 100, height: 100)
        let viewSize = CGSize(width: 320, height: 320)

        let flexView = UIFlexView()
        
        flexView.frame.size = viewSize
        flexView.backgroundColor = .lightGray
        flexView.flexDirection = .row
        flexView.flexWrap = .wrap
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "1"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "2"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "3"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "4"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "5"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "6"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "7"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "8"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "9"))
        assertSnapshot(matching: flexView, as: .image)
        
        flexView.addSubview(Box.staticallySized(boxSize, label: "10"))
        assertSnapshot(matching: flexView, as: .image)
    }

    func testColumnWrap() {
        let boxSize = CGSize(width: 100, height: 100)
        let viewSize = CGSize(width: 320, height: 320)

        let flexView = UIFlexView()

        flexView.frame.size = viewSize
        flexView.backgroundColor = .lightGray
        flexView.flexDirection = .column
        flexView.flexWrap = .wrap

        flexView.addSubview(Box.staticallySized(boxSize, label: "1"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "2"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "3"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "4"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "5"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "6"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "7"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "8"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "9"))
        assertSnapshot(matching: flexView, as: .image)

        flexView.addSubview(Box.staticallySized(boxSize, label: "10"))
        assertSnapshot(matching: flexView, as: .image)
    }
}
