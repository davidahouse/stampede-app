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
        maxCount = measurements.map { $0.idle + $0.active + $0.queued }.max() ?? 0
    }

    var body: some View {
        GeometryReader { reader in
            HStack(spacing: 0.0) {
                ForEach(0..<self.measurements.count) { i in
                    VStack(spacing: 0.0) {
                        Spacer()
                        Rectangle().fill(Color.purple).frame(height: reader.size.height * self.measurements[i].queuedPct)
                        Rectangle().fill(Color.green).frame(height: reader.size.height * self.measurements[i].activePct)
                        Rectangle().fill(Color.gray).frame(height: reader.size.height * self.measurements[i].idlePct)
                    }
                }
            }
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
