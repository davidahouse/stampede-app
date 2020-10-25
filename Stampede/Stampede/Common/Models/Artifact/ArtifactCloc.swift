//
//  ArtifactCloc.swift
//  Stampede
//
//  Created by David House on 10/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

public struct LinesOfCode: Codable, Equatable, Hashable {
    let code: Int?
    let blank: Int?
    let nFiles: Int?
    let comment: Int?
}

struct ArtifactClocLanguage: Equatable, Hashable {
    let language: String
    let loc: LinesOfCode
}

public typealias ArtifactCloc = [String: LinesOfCode]

extension ArtifactCloc {
    func sortedLanguages() -> [ArtifactClocLanguage] {
        return self.compactMap { if $0.key != "SUM" && $0.key != "header" {
            return ArtifactClocLanguage(language: $0.key, loc: $0.value)
        } else {
            return nil
        }
        }
    }
}

#if DEBUG
extension ArtifactCloc {
    static let someCloc = ["someLang": LinesOfCode(code: 42, blank: 12, nFiles: 2, comment: 44)]
}
#endif
