//
//  EmptyList.swift
//  Stampede-Mobile
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct EmptyList: View {
    
    // MARK: - Properties
    
    private let message: String
    
    // MARK: - Initializer
    
    init(_ message: String) {
        self.message = message
    }
    
    // MARK: - View
    
    var body: some View {
        List {
            PrimaryLabel(message)
        }
    }
}

#if DEBUG

struct EmptyList_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            EmptyList("Empty list message goes here...")
        }
    }
}

#endif
