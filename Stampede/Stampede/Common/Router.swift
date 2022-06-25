//
//  Router.swift
//  Stampede
//
//  Created by David House on 10/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

protocol RouterDelegate: class {
    func shouldRoute(to: Route) -> Bool
    func routeMethod(for: Route) -> RouteMethod
    func push(route: Route)
    func present(route: Route)
}

class Router: ObservableObject {

    weak var delegate: RouterDelegate?

    init(delegate: RouterDelegate? = nil) {
        self.delegate = delegate
    }

    func route(to route: Route) {
        guard let delegate = delegate,
              delegate.shouldRoute(to: route) else {
            return
        }

        let method = delegate.routeMethod(for: route)
        switch method {
        case .present:
            delegate.present(route: route)
        case .push:
            delegate.push(route: route)
        }
    }
}

extension Router {
    static func fromURL(_ url: URL) -> Route? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        switch url.path {
        case "/repositories/buildDetails":
            // TODO: How do we link to the build?
//            if let buildIDQueryItem = components?.queryItems?.filter({ $0.name == "buildID" }).first, let buildID = buildIDQueryItem.value {
//                return BuildRoute(build: nil, buildID: buildID)
//            } else {
                return nil
//            }
        default:
            return nil
        }
    }
}
