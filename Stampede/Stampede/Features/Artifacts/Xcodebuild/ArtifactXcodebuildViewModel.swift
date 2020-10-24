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

    @Published var testResults: [TestResult] = []
    
    override func didChangeState() {
        var computedResults: [TestResult] = []
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
        default:
            break
        }
        
        testResults = computedResults.sorted {
            if $0.className != $1.className {
                return $0.className < $1.className
            }
            return $0.testName < $1.testName
        }
    }
}

#if DEBUG
extension ArtifactXcodebuildViewModel {
    static let someViewModel = ArtifactXcodebuildViewModel(state: .results(ArtifactXcodebuild.someXcodebuild))
}
#endif
