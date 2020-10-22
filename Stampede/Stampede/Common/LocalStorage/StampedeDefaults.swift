//
//  StampedeDefaults.swift
//  Stampede
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import UIKit
import Combine

class StampedeDefaults: ObservableObject {

    var host: String?
    var hostSubject: PassthroughSubject<String, Never>? {
        didSet {
            self.hostSink = hostSubject?.sink(receiveValue: { (value) in
                UserDefaults.standard.set(value, forKey: "StampedeServerURL")
            })
        }
    }
    private var hostSink: AnyCancellable?

    var fixturePersona: String? {
        didSet {
            UserDefaults.standard.set(fixturePersona, forKey: "FixturePersona")
        }
    }

    init() {
        host = UserDefaults.standard.string(forKey: "StampedeServerURL")
        fixturePersona = UserDefaults.standard.string(forKey: "FixturePersona")
    }
}

#if DEBUG
extension StampedeDefaults {
    static var someDefaults: StampedeDefaults = {
        var defaults = StampedeDefaults()
        defaults.host = "https://somehost"
        return defaults
    }()
    static var defaultsWithNoHost: StampedeDefaults = {
        var defaults = StampedeDefaults()
        return defaults
    }()
}
#endif
