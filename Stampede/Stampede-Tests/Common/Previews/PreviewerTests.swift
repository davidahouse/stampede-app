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

@MainActor
class PreviewerTests: XCTestCase {

    class TestPreviewer: Previewable {

        static var viewModels: [PreviewData<String>] {
            [
                PreviewData(id: "default", viewModel: "Default VM"),
                PreviewData(id: "alt", viewModel: "Alt VM")
            ]
        }

        static func create(from viewModel: String) -> some View {
            Text(viewModel)
        }
    }

    func testPreviews() {
        capturedPreviews(TestPreviewer.capturedPreviews(title: "DebugPreviews"))
    }
}
