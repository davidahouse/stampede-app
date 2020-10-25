//
//  ArtifactXcodebuild.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

public struct ArtifactXcodebuild: Codable, Equatable, Hashable {
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

extension ArtifactXcodebuildDetails {
    static let someDetails = ArtifactXcodebuildDetails(classes: [
        ArtifactXcodebuildClass.someClass,
        ArtifactXcodebuildClass.someOtherClass
    ])
}

extension ArtifactXcodebuildClass {
    static let someClass = ArtifactXcodebuildClass(id: "someClass", className: "someClass", testCases: [
        ArtifactXcodebuildTestCase.passingCase,
        ArtifactXcodebuildTestCase.anotherPassingCase
    ])
    static let someOtherClass = ArtifactXcodebuildClass(id: "someOtherClass", className: "someOtherClass", testCases: [
        ArtifactXcodebuildTestCase.failedCase
    ])
}

extension ArtifactXcodebuildTestCase {
    static let passingCase = ArtifactXcodebuildTestCase(id: "someTest", status: "Success", testName: "passingTest")
    static let anotherPassingCase = ArtifactXcodebuildTestCase(id: "someSecondTest", status: "Success", testName: "secondPassingTest")
    static let failedCase = ArtifactXcodebuildTestCase(id: "someOtherTest", status: "Failed", testName: "failedTest")
}

extension ArtifactXcodebuildCodeCoverage {
    static let coverage = ArtifactXcodebuildCodeCoverage(coveredLines: 42, lineCoverage: 0.42, executableLines: 42, targets: [
        ArtifactXcodebuildCodeCoverageTarget.target
    ])
}

extension ArtifactXcodebuildCodeCoverageTarget {
    static let target = ArtifactXcodebuildCodeCoverageTarget(name: "target", coveredLines: 42, lineCoverage: 0.42, executableLines: 42, buildProductPath: "somePath", files: [
        ArtifactXcodebuildCodeCoverageFile.lowCoverage,
        ArtifactXcodebuildCodeCoverageFile.medCoverage,
        ArtifactXcodebuildCodeCoverageFile.highCoverage
    ])
}

extension ArtifactXcodebuildCodeCoverageFile {
    static let lowCoverage = ArtifactXcodebuildCodeCoverageFile(name: "someFile", path: "somePath", coveredLines: 42, lineCoverage: 0.30, executableLines: 42)
    static let medCoverage = ArtifactXcodebuildCodeCoverageFile(name: "someOtherFile", path: "somePath", coveredLines: 42, lineCoverage: 0.70, executableLines: 42)
    static let highCoverage = ArtifactXcodebuildCodeCoverageFile(name: "someThirdFile", path: "somePath", coveredLines: 42, lineCoverage: 0.90, executableLines: 42)
}

extension ArtifactXcodebuild {
    static let someXcodebuild = ArtifactXcodebuild(allTests: 42,
                                                   coverage: 12,
                                                   failedTests: 4,
                                                   successTests: 38,
                                                   details: ArtifactXcodebuildDetails.someDetails,
                                                   codeCoverage: ArtifactXcodebuildCodeCoverage.coverage)
}
#endif
