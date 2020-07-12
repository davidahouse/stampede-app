//
//  DefaultTheme.swift
//  Stampede-Mobile
//
//  Created by David House on 1/2/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class CurrentTheme: ObservableObject {

    // Colors
    let primaryTextColor = Color.black
    let secondaryTextColor = Color.gray
    let valueTextColor = Color.black
    
    let primaryBackground = Color(red: 44/255, green: 82/255, blue: 130/255)
    
    // Icons
    enum Icons: CaseIterable {
        case inProgress
        case failure
        case success
        
        case okStatus
        case warningStatus
        case errorStatus
        
        func image() -> some View {
            switch self {
            case .inProgress:
                return Image(systemName: "arrow.2.circlepath.circle.fill").foregroundColor(.blue)
            case .failure:
                return Image(systemName: "xmark.circle.fill").foregroundColor(.red)
            case .success:
                return Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            case .okStatus:
                return Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            case .warningStatus:
                return Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.yellow)
            case .errorStatus:
                return Image(systemName: "xmark.circle.fill").foregroundColor(.red)
            }
        }

        func title() -> String {
            switch self {
            case .inProgress:
                return "inProgress"
            case .failure:
                return "failure"
            case .success:
                return "success"
            case .okStatus:
                return "okStatus"
            case .warningStatus:
                return "warningStatus"
            case .errorStatus:
                return "errorStatus"
            }
        }
    }
}

struct CurrentThemeIconList: View {

    var body: some View {
        ForEach(CurrentTheme.Icons.allCases, id: \.self) { icon in
            HStack {
                icon.image()
                Text(icon.title())
            }
        }
    }
}

#if DEBUG
struct CurrentTheme_Previews: PreviewProvider {

    static let theme = CurrentTheme()

    static var previews: some View {
        Previewer {
            List {
                Text("Primary Text Color").foregroundColor(theme.primaryTextColor)
                Text("Secondary Text Color").foregroundColor(theme.secondaryTextColor)
                Text("Value Text Color").foregroundColor(theme.valueTextColor)
                Rectangle().fill(theme.primaryBackground)
                CurrentThemeIconList()
            }
        }
    }
}
#endif
