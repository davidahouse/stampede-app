//
//  TimeLabel.swift
//  Stampede
//
//  Created by David House on 2/27/21.
//  Copyright © 2021 David House. All rights reserved.
//

import SwiftUI

struct TimeLabel: View {
    
    let time: Date
    
    var body: some View {
        Text(time, style: .time)
            .font(.body).foregroundColor(Color("valueTextColor"))
    }
}

#if DEBUG

struct TimeLabel_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        debugPreviews
    }

    static var defaultViewModel: PreviewData<Date> {
        PreviewData(id: "someTitle", viewModel: Date(timeIntervalSince1970: 42))
    }

    static var alternateViewModels: [PreviewData<Date>] {
        []
    }

    static func create(from viewModel: Date) -> some View {
        return TimeLabel(time: viewModel)
    }
}

#endif

