//
//  TaskArtifact.swift
//  Stampede
//
//  Created by David House on 10/17/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

public struct TaskArtifact: Codable, Equatable, Hashable {
    let title: String
    let type: String
    let url: String?
}

#if DEBUG
extension TaskArtifact {
    static let someArtifact = TaskArtifact(title: "some artifact", type: "aType", url: nil)
    static let clocArtifact = TaskArtifact(title: "cloc artifact", type: "cloc", url: nil)
    static let xcodeBuildArtifact = TaskArtifact(title: "xcodebuild artifact", type: "xcodebuild", url: nil)
    static let linkArtifact = TaskArtifact(title: "link artifact", type: "link", url: "https://www.apple.com")
    static let someArtifacts = [someArtifact, clocArtifact, xcodeBuildArtifact, linkArtifact]
}
#endif
