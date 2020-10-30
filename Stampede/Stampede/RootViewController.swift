//
//  RootViewController.swift
//  Stampede
//
//  Created by David House on 10/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import UIKit

class RootViewController: UISplitViewController, UISplitViewControllerDelegate {

    // MARK: Private Properties

    private let dependencies: Dependencies
    private var mainFeature: MainFeature?
    private var currentRoute: Route?
    private var primaryNavController: UINavigationController?
    private var secondaryNavController: UINavigationController?

    // MARK: Initializers

    init(style: UISplitViewController.Style, dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(style: style)
        delegate = self
        preferredDisplayMode = .oneBesideSecondary
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public Methods

    func setupInitialFeatures(_ initialRoute: Route? = nil) {
        mainFeature = MainFeature(dependencies: dependencies, routerDelegate: self)
        primaryNavController = UINavigationController(rootViewController: mainFeature!)
        setViewController(primaryNavController, for: .primary)

        let secondary: UINavigationController = {
            if let route = initialRoute {
                let destination = route.makeFeature(dependencies)
                return UINavigationController(rootViewController: destination)
            } else {
                return UINavigationController()
            }
        }()
        secondaryNavController = secondary
        setViewController(secondaryNavController, for: .secondary)
    }

    // MARK: Overrides

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        // If we are expanding from compact, we need to adjust our primary
        // and secondary to match the current route
        if previousTraitCollection?.horizontalSizeClass == .compact {
            primaryNavController?.popToRootViewController(animated: false)
            if let route = currentRoute {
                let destination = route.makeFeature(dependencies)
                secondaryNavController?.viewControllers = [destination]
            }
        }
    }
}

extension RootViewController: RouterDelegate {
    func shouldRoute(to: Route) -> Bool {
        return true
    }

    func routeMethod(for: Route) -> RouteMethod {
        return .push
    }

    func push(route: Route) {
        currentRoute = route
        if traitCollection.horizontalSizeClass == .compact {
            mainFeature?.push(route: route)
        } else {
            let destination = route.makeFeature(dependencies)
            secondaryNavController?.viewControllers = [destination]
            if displayMode != .oneBesideSecondary {
                hide(.primary)
            }
        }
    }

    func present(route: Route) {
        if traitCollection.horizontalSizeClass == .compact {
            mainFeature?.present(route: route)
        }
    }
}
