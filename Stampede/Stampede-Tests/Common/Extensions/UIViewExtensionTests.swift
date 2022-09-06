//
//  UIViewExtensionTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class UIViewExtensionTests: XCTestCase {
    
    func testCanPinEdgesToAnotherView() {
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        let secondView = UIView()
        firstView.addSubview(secondView)
        secondView.pinEdges(to: firstView)
    }
}
