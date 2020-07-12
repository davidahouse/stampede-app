//
//  StampedeError.swift
//  Stampede
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public enum StampedeError: Error {
  case parsing(description: String)
  case network(description: String)
}

extension StampedeError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .parsing(let description):
            return "Parsing error: \(description)"
        case .network(let description):
            return "Network error: \(description)"
        }
    }
}
