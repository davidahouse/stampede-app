//
//  NetworkErrorView.swift
//  Stampede
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit

struct NetworkErrorView: View {
    
    let error: ServiceError
    
    var body: some View {
        VStack {
            PrimaryLabel("Network error received. Check your stampede server url in settings.")
            SecondaryLabel(error.errorDescription ?? "")
        }
    }
}

#if DEBUG
struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            NetworkErrorView(error: .network(description: "error description here"))
        }
    }
}
#endif
