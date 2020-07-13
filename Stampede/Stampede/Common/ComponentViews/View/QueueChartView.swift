//
//  QueueChartView.swift
//  Stampede
//
//  Created by David House on 6/8/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct QueueChartView: View {

    let measurements: [QueueGaugeInfo]
    let maxCount: Int

    init(measurements: [QueueGaugeInfo]) {
        self.measurements = measurements
        maxCount = measurements.map { $0.active + $0.queued }.max() ?? 0
    }

    var body: some View {
        if maxCount > 0 {
            GeometryReader { reader in
                HStack(spacing: 2.0) {
                    ForEach(0..<self.measurements.count) { i in
                        VStack(spacing: 0.0) {
                            Spacer()
                            Rectangle()
                                .barHeight(reader.size.height, max: maxCount, info: self.measurements[i])
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
    func barHeight(_ height: CGFloat, max: Int, info: QueueGaugeInfo) -> some View {
        guard max > 0, info.total > 0 else {
            return self
                .fill(Color.blue)
                .frame(height: 1.0)
        }

        if info.queued > 0 {
            return self
                .fill(Color.purple)
                .frame(height: height * CGFloat(CGFloat(info.total) / CGFloat(max)))
        } else {
            return self
                .fill(Color.green)
                .frame(height: height * CGFloat(CGFloat(info.total) / CGFloat(max)))
        }
    }
}

struct QueueChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QueueChartView(measurements: [])
            QueueChartView(measurements: [QueueGaugeInfo(title: "", idle: 0, active: 0, queued: 0)])
            QueueChartView(measurements: [
                QueueGaugeInfo(title: "", idle: 4, active: 0, queued: 0),
                QueueGaugeInfo(title: "", idle: 3, active: 1, queued: 0),
                QueueGaugeInfo(title: "", idle: 2, active: 2, queued: 0),
                QueueGaugeInfo(title: "", idle: 0, active: 4, queued: 0),
                QueueGaugeInfo(title: "", idle: 0, active: 4, queued: 4),
                QueueGaugeInfo(title: "", idle: 0, active: 4, queued: 2),
                QueueGaugeInfo(title: "", idle: 4, active: 0, queued: 0)
            ])
        }
    }
}
