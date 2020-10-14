//
//  BaseView.swift
//  Stampede
//
//  Created by David House on 10/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit

struct BaseView<T, Content: View>: View {
    @ObservedObject var viewModel: BaseViewModel<T>
    var content: (T) -> Content

    init(viewModel: BaseViewModel<T>, @ViewBuilder content: @escaping (T) -> Content) {
        self.viewModel = viewModel
        self.content = content
    }

    var body: some View {
        switch viewModel.state {
        case .loading:
            Text("Loading...")
        case .networkError:
            Text("Network error...")
        case .results(let object):
            content(object)
        }
    }
}
