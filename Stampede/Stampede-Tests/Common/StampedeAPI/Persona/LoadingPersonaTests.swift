//
//  LoadingPersonaTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import HouseKit
@testable import Stampede

class LoadingPersonaTests: XCTestCase {

    let persona = LoadingPersona()

    func testAllPropertiesReturnError() {
        XCTAssertTrue(isLoading(persona.repositories))
        XCTAssertTrue(isLoading(persona.repositoryActiveBuilds))
        XCTAssertTrue(isLoading(persona.repositoryBuilds))
        XCTAssertTrue(isLoading(persona.activeBuilds))
        XCTAssertTrue(isLoading(persona.queues))
        XCTAssertTrue(isLoading(persona.workerStatus))
        XCTAssertTrue(isLoading(persona.activeTasks))
        XCTAssertTrue(isLoading(persona.historyTasks))
        XCTAssertTrue(isLoading(persona.hourlySummary))
        XCTAssertTrue(isLoading(persona.tasks))
        XCTAssertTrue(isLoading(persona.configDefaults))
        XCTAssertTrue(isLoading(persona.configOverrides))
        XCTAssertTrue(isLoading(persona.configQueues))
        XCTAssertTrue(isLoading(persona.buildKeys))
        XCTAssertTrue(isLoading(persona.buildDetails))
        XCTAssertTrue(isLoading(persona.taskDetails))
        XCTAssertTrue(isLoading(persona.artifactCloc))
        XCTAssertTrue(isLoading(persona.historyBuilds))
        XCTAssertTrue(isLoading(persona.repositorySourceBuilds))
    }

    private func isLoading<T>(_ value: FixtureResponse<T>) -> Bool {
        switch value {
        case .loading:
            return true
        default:
            return false
        }
    }
}
