//
//  QueueChartView.swift
//  Stampede
//
//  Created by David House on 6/8/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct QueueChartView: View {

    let measurements: [Int]
    let maxCount: Int

    init(measurements: [Int]) {
        self.measurements = measurements
        maxCount = measurements.max() ?? 0
    }

    var body: some View {
        if measurements.count > 0 {
            GeometryReader { reader in
                HStack(alignment: .bottom, spacing: 2.0) {
                    ForEach(self.measurements, id: \.self) { i in
                        VStack(spacing: 0.0) {
                            Spacer()
                            Rectangle()
                                .barHeight(reader.size.height, max: maxCount, measurement: i)
                        }
                    }
                }
            }.padding(15.0)
        } else {
            Text("No data points")
        }
    }
}

extension Rectangle {
    func barHeight(_ height: CGFloat, max: Int, measurement: Int) -> some View {
        guard max > 0, measurement > 0 else {
            return self
                .fill(Color.blue)
                .frame(height: 1.0)
        }

        return self
            .fill(Color.purple)
            .frame(height: height * CGFloat(CGFloat(measurement) / CGFloat(max)))
    }
}

#if DEBUG
struct QueueChartView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        QueueChartView_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<[Int]> {
        PreviewData(id: "basicChart", viewModel: [0, 0, 4, 1, 5, 6, 0, 0, 0, 2, 3])
    }

    static var alternateViewModels: [PreviewData<[Int]>] {
        [
            PreviewData(id: "empty", viewModel: []),
            PreviewData(id: "singleZero", viewModel: [0]),
            PreviewData(id: "singleNonZero", viewModel: [42])
        ]
    }

    static func create(from viewModel: [Int]) -> some View {
        return QueueChartView(measurements: viewModel)
    }
}
#endif
