//
//  StampedeDefaults.swift
//  Stampede
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import UIKit
import Combine

protocol DefaultsProvider {
    func set(_ value: Any?, forKey defaultName: String)
    func string(forKey defaultName: String) -> String?
}

extension UserDefaults: DefaultsProvider { }

class DebugDefaultsProvider: DefaultsProvider {

    private var stampedeServerURL = ""
    private var fixturePersona = ""
    
    init() {
        if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"] {
            stampedeServerURL = stampedeServer
            fixturePersona = "happy"
            if stampedeServer == "fixtures", let persona = ProcessInfo.processInfo.environment["Persona"] {
                fixturePersona = persona
            }
        } else {
            stampedeServerURL = "fixtures"
            fixturePersona = "happy"
        }
    }
    
    func set(_ value: Any?, forKey defaultName: String) {
        
        guard let stringValue = value as? String else {
            return
        }
        
        switch defaultName {
        case "StampedeServerURL":
            stampedeServerURL = stringValue
        case "FixturePersona":
            fixturePersona = stringValue
        default:
            break
        }
    }
    
    func string(forKey defaultName: String) -> String? {

        switch defaultName {
        case "StampedeServerURL":
            return stampedeServerURL
        case "FixturePersona":
            return fixturePersona
        default:
            return ""
        }
    }
}

class StampedeDefaults: ObservableObject {

    static var standard = StampedeDefaults()
    static var debug = StampedeDefaults(provider: DebugDefaultsProvider())
    
    private let provider: DefaultsProvider
    
    var host: String?
    var hostSubject: PassthroughSubject<String, Never>? {
        didSet {
            self.hostSink = hostSubject?.sink(receiveValue: { [weak self] (value) in
                self?.provider.set(value, forKey: "StampedeServerURL")
            })
        }
    }
    private var hostSink: AnyCancellable?

    var fixturePersona: String? {
        didSet {
            provider.set(fixturePersona, forKey: "FixturePersona")
        }
    }

    init(provider: DefaultsProvider = UserDefaults.standard) {
        self.provider = provider
        host = provider.string(forKey: "StampedeServerURL")
        fixturePersona = provider.string(forKey: "FixturePersona")
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
