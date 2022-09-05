//
//  BuildTaskViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class BuildTaskViewModelTests: XCTestCase {

    let viewModel = BuildTaskViewModel(taskID: "some-task-id")

    func testReturnsCorrectCategoryForArtifacts() {
        let expected: [(String, BuildTaskViewModel.ArtifactCategory)] = [
            ("link", .openURL),
            ("installplist", .installplist),
            ("anythingelse", .none),
            ("", .none)
        ]
        
        for expecting in expected {
            let artifact = TaskArtifact(title: "some-artifact", type: expecting.0, url: nil)
            XCTAssertEqual(viewModel.categoryForArtifact(artifact), expecting.1)
        }
    }
    
    func testCanGenerateAppInstallURL() {
        let url = viewModel.appInstallURL(TaskArtifact.appInstallArtifact)
        XCTAssertNotNil(url)
    }
    
    func testReturnsNilAppInstallURLForNonAppInstallArtifact() {
        let url = viewModel.appInstallURL(TaskArtifact.linkArtifact)
        XCTAssertNil(url)
    }
    
    func testReturnsNilIfArtifactURLIsNil() {
        let url = viewModel.appInstallURL(TaskArtifact(title: "some-artifact", type: "installplist", url: nil))
        XCTAssertNil(url)
    }
    
    func testFetchesTaskDetailsWhenFetchCalled() async {
        let fixtureProvider = StampedeServiceFixtureProvider(host: "any-host")
        let service = StampedeService(provider: fixtureProvider)
        await viewModel.fetch(service: service)
        XCTAssertTrue(fixtureProvider.fetchTaskDetailsCalled)
    }
}
