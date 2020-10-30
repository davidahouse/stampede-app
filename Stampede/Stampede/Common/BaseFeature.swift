//
//  BaseFeature.swift
//  Stampede
//
//  Created by David House on 10/10/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import HouseKit

class BaseFeature: UIViewController {

    // MARK: - Public properties

    let dependencies: Dependencies
    let router: Router

    init(dependencies: Dependencies, routerDelegate: RouterDelegate? = nil) {
        self.dependencies = dependencies
        router = Router()
        super.init(nibName: nil, bundle: nil)
        if let routerDelegate = routerDelegate {
            router.delegate = routerDelegate
        } else {
            router.delegate = self
        }
    }

    required init?(coder: NSCoder) {
        return nil
    }

    lazy var childViewController: UIViewController = {
        makeChildViewController()
    }()

    func makeChildViewController() -> UIViewController {
        UIHostingController(rootView: EmptyView())
    }

    override func viewDidLoad() {
        addChild(childViewController)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
        childViewController.view.pinEdges(to: view)
    }
}

extension BaseFeature: RouterDelegate {
    func shouldRoute(to: Route) -> Bool {
        return true
    }

    func routeMethod(for: Route) -> RouteMethod {
        return .push
    }

    func push(route: Route) {
        let destination = route.makeFeature(dependencies)
        navigationController?.pushViewController(destination, animated: true)
    }

    func present(route: Route) {
        let destination = route.makeFeature(dependencies)
        present(destination, animated: true, completion: {})
    }
}
