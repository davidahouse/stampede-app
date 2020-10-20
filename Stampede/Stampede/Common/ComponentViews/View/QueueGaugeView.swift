//
//  QueueGaugeView.swift
//  Stampede
//
//  Created by David House on 6/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct QueueGaugeInfo: Hashable {
    let title: String
    let idle: Int
    let active: Int
}

struct QueueGaugeView: View {

    private struct QueueGaugePieceInfo {
        let start: Double
        let end: Double
        let color: Color
    }

    private let innerPieces: [QueueGaugePieceInfo]
    private let title: String

    init(info: QueueGaugeInfo) {
        var generatedPieces: [QueueGaugePieceInfo] = []
        let total: Int = info.active + info.idle
        let pieceGap: Double = 1.0
        let totalSize: Double = 360.0 - Double(pieceGap * Double(total))
        let pieceSize: Double = totalSize / Double(total)
        var start = 0.0

        for _ in 0..<info.idle {
            generatedPieces.append(QueueGaugePieceInfo(start: start, end: start + pieceSize, color: Color.gray))
            start += pieceSize
            start += pieceGap
        }

        for _ in 0..<info.active {
            generatedPieces.append(QueueGaugePieceInfo(start: start, end: start + pieceSize, color: Color.green))
            start += pieceSize
            start += pieceGap
        }

        // Check for special case of 0 pieces.
        if generatedPieces.count == 0 {
            generatedPieces.append(
                QueueGaugePieceInfo(start: 0.0, end: 360.0, color: Color.blue)
            )
        }
        innerPieces = generatedPieces
        title = info.title
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ZStack {
                    ForEach(0..<self.innerPieces.count, id: \.self) { i in
                        QueueGaugePiece(startDegrees: self.innerPieces[i].start, endDegrees: self.innerPieces[i].end)
                            .stroke(lineWidth: reader.size.height * 0.05)
                            .fill(self.innerPieces[i].color)
                    }
                }
                PrimaryLabel(self.title)
            }
        }
    }
}

struct QueueGaugePiece: Shape {

    var startDegrees: Double
    var endDegrees: Double

    func path(in rect: CGRect) -> Path {
        let size = min(rect.height, rect.width)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var p = Path()
        p.addArc(center: center, radius: size / 4.0, startAngle: .degrees(startDegrees), endAngle: .degrees(endDegrees), clockwise: false)
        return p
    }
}

#if DEBUG
struct QueueGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QueueGaugeView(info: QueueGaugeInfo(title: "empty", idle: 0, active: 0)).previewDependencies()
            QueueGaugeView(info: QueueGaugeInfo(title: "some", idle: 2, active: 0)).previewDependencies()
            QueueGaugeView(info: QueueGaugeInfo(title: "first", idle: 4, active: 0)).previewDependencies()
            QueueGaugeView(info: QueueGaugeInfo(title: "second", idle: 2, active: 8)).previewDependencies()
            QueueGaugeView(info: QueueGaugeInfo(title: "third", idle: 0, active: 8)).previewDependencies()
        }
    }
}
#endif
