//
//  XCTestCase+Extension.swift
//  Stampede-MobileTests
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import XCTest
import SwiftUI

extension XCTestCase {

    func captureScreen(title: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func capturedPreviews(_ previews: [(String, UIImage)]) {
        for preview in previews {
            let attachment = XCTAttachment(image: preview.1)
            attachment.name = preview.0
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
}
