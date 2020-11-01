//
//  PreviewerTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/31/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import SwiftUI
@testable import Stampede

class PreviewerTests: XCTestCase {

    class TestPreviewer: Previewable {
        static var defaultViewModel: PreviewData<String> {
            PreviewData(id: "default", viewModel: "Default VM")
        }

        static var alternateViewModels: [PreviewData<String>] {
            [
                PreviewData(id: "alt", viewModel: "Alt VM")
            ]
        }

        static func create(from viewModel: String) -> some View {
            Text(viewModel)
        }
    }

    func testDebugPreviews() {
        capture(TestPreviewer.debugPreviews, title: "DebugPreviews")
    }

    func testDevicePreviews() {
        capture(TestPreviewer.devicePreviews, title: "DevicePreviews")
    }
}
