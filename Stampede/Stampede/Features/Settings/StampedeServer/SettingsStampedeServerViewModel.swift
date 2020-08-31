//
//  StampedeServerViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SettingsStampedeServerViewModel: ObservableObject {

    // MARK: - Published properties

    @Published var stampedeServerURL: String {
        didSet {
            self.subject?.send(stampedeServerURL)
            print("new server URL: \(stampedeServerURL)")
        }
    }

    // MARK: - Properties

    let subject: PassthroughSubject<String, Never>?

    // MARK: - Initializer

    init(stampedeServerURL: String = "", subject: PassthroughSubject<String, Never>? = nil) {
        self.stampedeServerURL = stampedeServerURL
        self.subject = subject
    }
}

#if DEBUG

extension SettingsStampedeServerViewModel {
    static let someViewModel = SettingsStampedeServerViewModel(stampedeServerURL: "https://somehost")
    static let someViewModelWithNoHost = SettingsStampedeServerViewModel()
}

#endif
