//
//  ArtifactClocView.swift
//  Stampede
//
//  Created by David House on 10/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct ArtifactClocView: View {

    // MARK: - View Model

    @EnvironmentObject var viewModel: ArtifactClocViewModel

    // MARK: - Body

    var body: some View {
        BaseView(viewModel: viewModel, content: { cloc in
            List {
                ForEach(cloc.sortedLanguages(), id: \.self) { lang in
                    Section(header: Text(lang.language), content: {
                        HStack {
                            PrimaryLabel("Code lines")
                            Spacer()
                            ValueLabel("\(lang.loc.code ?? 0)")
                        }

                        HStack {
                            PrimaryLabel("Files")
                            Spacer()
                            ValueLabel("\(lang.loc.nFiles ?? 0)")
                        }

                        HStack {
                            PrimaryLabel("Blank lines")
                            Spacer()
                            ValueLabel("\(lang.loc.blank ?? 0)")
                        }

                        HStack {
                            PrimaryLabel("Comment lines")
                            Spacer()
                            ValueLabel("\(lang.loc.comment ?? 0)")
                        }
                    })
                }
            }
        })
    }
}

#if DEBUG
struct ArtifactClocView_Previews: PreviewProvider {
    static var previews: some View {
        ArtifactClocView_Previews.devicePreviews
    }
}

extension ArtifactClocView_Previews: Previewable {

    static var defaultViewModel: PreviewData<ArtifactClocViewModel> {
        PreviewData(id: "someResults", viewModel: ArtifactClocViewModel(state: .results(ArtifactCloc.someCloc)))
    }

    static var alternateViewModels: [PreviewData<ArtifactClocViewModel>] {
        [
            PreviewData(id: "loading", viewModel: ArtifactClocViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: ArtifactClocViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: ArtifactClocViewModel) -> some View {
        return ArtifactClocView().environmentObject(viewModel)
    }
}
#endif
