//
//  QueueSummaryCell.swift
//  Stampede
//
//  Created by David House on 8/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct QueueSummaryCell: View {

    let queueSummary: QueueSummary

    var body: some View {
        HStack {
            switch queueSummary.stats.waiting {
            case 0..<3:
                CurrentTheme.Icons.okStatus.image().font(Font.system(size: 32, weight: .regular))
            case 3..<6:
                CurrentTheme.Icons.warningStatus.image().font(Font.system(size: 32, weight: .regular))
            default:
                CurrentTheme.Icons.errorStatus.image().font(Font.system(size: 32, weight: .regular))
            }

            VStack(alignment: .leading) {
                PrimaryLabel(queueSummary.queue)
            }
            Spacer()
            switch queueSummary.stats.waiting {
            case 0:
                ValueLabel("No waiting tasks")
            case 1:
                ValueLabel("1 waiting task")
            default:
                ValueLabel("\(queueSummary.stats.waiting) waiting tasks")
            }
        }
    }
}

#if DEBUG
struct QueueSummaryCell_Previews: PreviewProvider {
    static var previews: some View {
        QueueSummaryCell_Previews.debugPreviews
    }
}

extension QueueSummaryCell_Previews: Previewable {
    static var previewViewModels: [PreviewData<QueueSummary>] {
        return [
            PreviewData(id: "noWaiting", viewModel: QueueSummary.noWaiting),
            PreviewData(id: "oneWaiting", viewModel: QueueSummary.oneWaiting),
            PreviewData(id: "moreWaiting", viewModel: QueueSummary.moreWaiting),
            PreviewData(id: "alotWaiting", viewModel: QueueSummary.alotWaiting)
        ]
    }
    
    static func create(from viewModel: QueueSummary) -> some View {
        return QueueSummaryCell(queueSummary: viewModel)
    }
}
#endif
