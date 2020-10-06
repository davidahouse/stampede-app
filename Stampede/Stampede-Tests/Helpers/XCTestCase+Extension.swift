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

    func capture<T: View>(_ view: T, title: String) {
        let host = UIHostingController(rootView: view)

        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            window.rootViewController = host
            UIGraphicsBeginImageContextWithOptions(host.view.bounds.size, host.view.isOpaque, 0)
            host.view.drawHierarchy(in: host.view.bounds, afterScreenUpdates: true)
            let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            host.dismiss(animated: false)
            window.rootViewController = nil

            let attachment = XCTAttachment(image: snapshotImage)
            attachment.name = title
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
    
    func captureScreen(title: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
