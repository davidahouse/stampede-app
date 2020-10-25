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
                                PrimaryLabel("Code coverage %")
                                Spacer()
                                ValueLabel(String(format: "%.2f", xcodebuild.codeCoverage.lineCoverage * 100.0))
                            }
                })

                Section(header: Text("Test execution"), content: {
                    ForEach(viewModel.testResults, id: \.self) { result in
                        HStack {
                            result.icon.image().font(Font.system(size: 24, weight: .regular))
                            VStack(alignment: .leading) {
                                PrimaryLabel(result.className)
                                SecondaryLabel(result.testName)
                            }
                        }
                    }
                })

                Section(header: Text("Code coverage"), content: {
                    ForEach(viewModel.coverages, id: \.self) { coverage in
                        HStack {
                            coverage.icon.image().font(Font.system(size: 24, weight: .regular))
                            PrimaryLabel(coverage.fileName)
                        }
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