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
    
    func captureCropped<T: View>(_ view: T, title: String) {
        let host = UIHostingController(rootView: view)
        let size = host.sizeThatFits(in: UIScreen.main.bounds.size)
        host.view.bounds.size = size
        host.view.sizeToFit()
            UIGraphicsBeginImageContextWithOptions(host.view.bounds.size, host.view.isOpaque, 0)
            host.view.drawHierarchy(in: host.view.bounds, afterScreenUpdates: true)
            let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            host.dismiss(animated: false)

//            let cropRect = CGRect(x: (host.view.bounds.size.width / 2) - (size.width / 2), y: (host.view.bounds.size.height / 2), width: size.width, height: size.height)
//            if let cgImage = snapshotImage.cgImage?.cropping(to: cropRect) {
            //let croppedImage = UIImage(cgImage: cgImage)
                let attachment = XCTAttachment(image: snapshotImage)
                attachment.name = title
                attachment.lifetime = .keepAlways
                add(attachment)
            //}
        //}
    }

    func capture(_ feature: UIViewController, title: String) {
        let window = UIWindow()
        window.rootViewController = feature
//        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
        UIGraphicsBeginImageContextWithOptions(feature.view.bounds.size, feature.view.isOpaque, 0)
        feature.view.drawHierarchy(in: feature.view.bounds, afterScreenUpdates: true)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        window.rootViewController = nil

        let attachment = XCTAttachment(image: snapshotImage)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
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
