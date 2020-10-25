//
//  ArtifactXcodebuildViewModel.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class ArtifactXcodebuildViewModel: BaseViewModel<ArtifactXcodebuild> {
    
    struct TestResult: Equatable, Hashable {
        let className: String
        let testName: String
        let icon: CurrentTheme.Icons
    }

    struct Coverage: Equatable, Hashable {
        let fileName: String
        let coverage: Double
        let icon: CurrentTheme.Icons
    }

    @Published var testResults: [TestResult] = []
    @Published var coverages: [Coverage] = []

    override func didChangeState() {
        var computedResults: [TestResult] = []
        var computedCoverage: [Coverage] = []

        switch state {
        case .results(let xcodebuild):
            for testClass in xcodebuild.details.classes {
                for testCase in testClass.testCases {
                    let icon: CurrentTheme.Icons = {
                        switch testCase.status {
                        case "Success":
                            return .success
                        default:
                            return .failure
                        }
                    }()
                    computedResults.append(TestResult(className: testClass.className, testName: testCase.testName, icon: icon))
                }
            }

            for target in xcodebuild.codeCoverage.targets {
                for file in target.files {
                    let icon: CurrentTheme.Icons = {
                        if file.lineCoverage <= 0.5 {
                            return .failure
                        } else if file.lineCoverage <= 0.80 {
                            return .warningStatus
                        } else {
                            return .success
                        }
                    }()
                    computedCoverage.append(Coverage(fileName: file.name, coverage: file.lineCoverage * 100.0, icon: icon))
                }
            }
        default:
            break
        }
        
        testResults = computedResults.sorted {
            if $0.className != $1.className {
                return $0.className < $1.className
            }
            return $0.testName < $1.testName
        }

        coverages = computedCoverage.sorted {
            return $0.fileName < $1.fileName
        }
    }
}

#if DEBUG
extension ArtifactXcodebuildViewModel {
    static let someViewModel = ArtifactXcodebuildViewModel(state: .results(ArtifactXcodebuild.someXcodebuild))
}
#endif
