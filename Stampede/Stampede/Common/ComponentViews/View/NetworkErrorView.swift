//
//  NetworkErrorView.swift
//  Stampede
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct NetworkErrorView: View {
    var body: some View {
        PrimaryLabel("Network error received. Check your stampede server url in settings.")
    }
}

#if DEBUG
struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            NetworkErrorView()
        }
    }
}
#endif
