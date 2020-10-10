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

class BaseFeature<T>: UIViewController {

    let dependencies: T

    init(dependencies: T) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
