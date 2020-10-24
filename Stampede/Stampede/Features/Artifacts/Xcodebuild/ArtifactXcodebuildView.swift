//
//  ArtifactXcodebuildView.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct ArtifactXcodebuildView: View {
    // MARK: - View Model

    @EnvironmentObject var viewModel: ArtifactXcodebuildViewModel

    // MARK: - Body

    var body: some View {
        BaseView(viewModel: viewModel, content: { xcodebuild in
            List {
                Section(header: Text("Xcode build results"), content: {
                            HStack {
                                PrimaryLabel("Total # of tests")
                                Spacer()
                                ValueLabel("\(xcodebuild.allTests)")
                            }
                            HStack {
                                PrimaryLabel("Success tests")
                                Spacer()
                                ValueLabel("\(xcodebuild.successTests)")
                            }
                            HStack {
                                PrimaryLabel("Failed tests")
                                Spacer()
                                ValueLabel("\(xcodebuild.failedTests)")
                            }
                            HStack {
                                PrimaryLabel("Code coverage")
                                Spacer()
                                ValueLabel("\((xcodebuild.codeCoverage.lineCoverage * 100.0), specifier: "%.2f") %")
                            }
                })
            }
        })
    }
}

struct ArtifactXcodebuildView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            ArtifactXcodebuildView().environmentObject(ArtifactXcodebuildViewModel(state: .results(ArtifactXcodebuild.someXcodebuild)))
        }
    }
}
