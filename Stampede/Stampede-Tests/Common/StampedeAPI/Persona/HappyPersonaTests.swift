//
//  HappyPersonaTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import HouseKit
@testable import Stampede

class HappyPersonaTests: XCTestCase {

    let persona = HappyPersona()

    func testAllPropertiesReturnResults() {
        XCTAssertTrue(isResults(persona.repositories))
        XCTAssertTrue(isResults(persona.repositoryActiveBuilds))
        XCTAssertTrue(isResults(persona.repositoryBuilds))
        XCTAssertTrue(isResults(persona.activeBuilds))
        XCTAssertTrue(isResults(persona.queues))
        XCTAssertTrue(isResults(persona.workerStatus))
        XCTAssertTrue(isResults(persona.activeTasks))
        XCTAssertTrue(isResults(persona.historyTasks))
        XCTAssertTrue(isResults(persona.hourlySummary))
        XCTAssertTrue(isResults(persona.tasks))
        XCTAssertTrue(isResults(persona.configDefaults))
        XCTAssertTrue(isResults(persona.configOverrides))
        XCTAssertTrue(isResults(persona.configQueues))
        XCTAssertTrue(isResults(persona.buildKeys))
        XCTAssertTrue(isResults(persona.buildDetails))
        XCTAssertTrue(isResults(persona.taskDetails))
        XCTAssertTrue(isResults(persona.historyBuilds))
        XCTAssertTrue(isResults(persona.repositorySourceBuilds))
    }

    private func isResults<T>(_ value: FixtureResponse<T>) -> Bool {
        switch value {
        case .results:
            return true
        default:
            return false
        }
    }
}
