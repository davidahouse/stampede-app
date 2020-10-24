//
//  ArtifactXcodebuild.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

struct ArtifactXcodebuild: Codable, Equatable, Hashable {
    let allTests: Int
    let coverage: Int
    let failedTests: Int
    let successTests: Int
    let details: ArtifactXcodebuildDetails
    let codeCoverage: ArtifactXcodebuildCodeCoverage
}

struct ArtifactXcodebuildDetails: Codable, Equatable, Hashable {
    let classes: [ArtifactXcodebuildClass]
}

struct ArtifactXcodebuildClass: Codable, Equatable, Hashable {
    let id: String
    let className: String
    let testCases: [ArtifactXcodebuildTestCase]
}

struct ArtifactXcodebuildTestCase: Codable, Equatable, Hashable {
    let id: String
    let status: String
    let testName: String
}

struct ArtifactXcodebuildCodeCoverage: Codable, Equatable, Hashable {
    let coveredLines: Int
    let lineCoverage: Double
    let executableLines: Int
    let targets: [ArtifactXcodebuildCodeCoverageTarget]
}

struct ArtifactXcodebuildCodeCoverageTarget: Codable, Equatable, Hashable {
    let name: String
    let coveredLines: Int
    let lineCoverage: Double
    let executableLines: Int
    let buildProductPath: String
    let files: [ArtifactXcodebuildCodeCoverageFile]
}

struct ArtifactXcodebuildCodeCoverageFile: Codable, Equatable, Hashable {
    let name: String
    let path: String
    let coveredLines: Int
    let lineCoverage: Double
    let executableLines: Int
}

#if DEBUG
extension ArtifactXcodebuild {
    static let someXcodebuild = ArtifactXcodebuild(allTests: 42, coverage: 12, failedTests: 4, successTests: 38, details: ArtifactXcodebuildDetails(classes: [ArtifactXcodebuildClass(id: "someClass", className: "someClass", testCases: [ArtifactXcodebuildTestCase(id: "someTest", status: "success", testName: "someTest")])]), codeCoverage: ArtifactXcodebuildCodeCoverage(coveredLines: 42, lineCoverage: 0.34, executableLines: 42, targets: [ArtifactXcodebuildCodeCoverageTarget(name: "someTarget", coveredLines: 42, lineCoverage: 0.34, executableLines: 42, buildProductPath: "somePath", files: [ArtifactXcodebuildCodeCoverageFile(name: "someFile", path: "somePath", coveredLines: 42, lineCoverage: 0.34, executableLines: 42)])]))
}

#endif
