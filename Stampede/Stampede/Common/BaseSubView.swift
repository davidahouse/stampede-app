//
//  BaseSubView.swift
//  Stampede
//
//  Created by David House on 10/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit

struct BaseSubView<T, Content: View>: View {
    var state: ViewModelState<T>
    var content: (T) -> Content

    init(state: ViewModelState<T>, @ViewBuilder content: @escaping (T) -> Content) {
        self.state = state
        self.content = content
    }

    var body: some View {
        switch state {
        case .loading:
            Text("Loading...")
        case .networkError:
            Text("Network error...")
        case .results(let object):
            content(object)
        }
    }
}
