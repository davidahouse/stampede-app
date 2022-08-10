//
//  ValueLabel.swift
//  Stampede-Mobile
//
//  Created by David House on 1/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct ValueLabel: View {
    
    @EnvironmentObject var theme: CurrentTheme

    let value: String

    init(_ value: String) {
        self.value = value
    }

    var body: some View {
        Text(value).font(.body).foregroundColor(Color("valueTextColor"))
    }}

#if DEBUG

struct ValueLabel_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<String>] {
        [
            PreviewData(id: "someTitle", viewModel: "123")
        ]
    }

    static func create(from viewModel: String) -> some View {
        return ValueLabel(viewModel)
    }
}

#endif
