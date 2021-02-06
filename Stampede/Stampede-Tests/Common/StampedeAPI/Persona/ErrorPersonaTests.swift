//
//  ErrorPersonaTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import HouseKit
@testable import Stampede

class ErrorPersonaTests: XCTestCase {

    let persona = ErrorPersona()

    func testAllPropertiesReturnError() {
        XCTAssertTrue(isError(persona.repositories))
        XCTAssertTrue(isError(persona.repositoryActiveBuilds))
        XCTAssertTrue(isError(persona.repositoryBuilds))
        XCTAssertTrue(isError(persona.activeBuilds))
        XCTAssertTrue(isError(persona.queues))
        XCTAssertTrue(isError(persona.workerStatus))
        XCTAssertTrue(isError(persona.activeTasks))
        XCTAssertTrue(isError(persona.historyTasks))
        XCTAssertTrue(isError(persona.hourlySummary))
        XCTAssertTrue(isError(persona.tasks))
        XCTAssertTrue(isError(persona.configDefaults))
        XCTAssertTrue(isError(persona.configOverrides))
        XCTAssertTrue(isError(persona.configQueues))
        XCTAssertTrue(isError(persona.buildKeys))
        XCTAssertTrue(isError(persona.buildDetails))
        XCTAssertTrue(isError(persona.taskDetails))
        XCTAssertTrue(isError(persona.historyBuilds))
        XCTAssertTrue(isError(persona.repositorySourceBuilds))
    }

    private func isError<T>(_ value: FixtureResponse<T>) -> Bool {
        switch value {
        case .error:
            return true
        default:
            return false
        }
    }
}
