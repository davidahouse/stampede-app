//
//  StampedeAPIEndpointTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class StampedeAPIEndpointTests: XCTestCase {

    func testEndpointsGenerateURLs() {
        let endpoints: [StampedeAPIEndpoint] = [
            .repositories,
                .activeBuilds("owner", "repo"),
                .repositoryBuilds("owner", "repo"),
                .buildKeys("owner", "repo", "type"),
                .monitorActiveBuilds,
                .monitorActiveTasks,
                .monitorWorkerStatus,
                .monitorQueues,
                .historyTasks,
                .historyHourlySummary,
                .adminTasks,
                .adminConfigDefaults,
                .adminConfigOverrides,
                .adminQueues
        ]

        for endpoint in endpoints {
            XCTAssertTrue(endpoint.url(host: "http://myhost.org").absoluteString.contains("myhost.org"))
        }
    }
}
