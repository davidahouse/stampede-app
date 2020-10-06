//
//  FavoriteRepositoriesAvailableFromMainScreen.swift
//  Stampede-UITests
//
//  Created by David House on 9/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest

class ScenarioMainScreen: BDDTestCase {

    func testFavoriteRepositoryDisplayedInRepositoriesSection() throws {
        givenTheMainScreenIsDisplayed()
        andTheRepositoriesSectionIsVisible()
        thenTheFavoriteRepositoryIsDisplayed()
        captureScreen(title: "Main Screen")
    }

    func testMainScreenContainsRouteToMonitorLiveScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheMonitorLiveButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToMonitorActiveBuildsScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheMonitorActiveBuildsButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToMonitorActiveTasksScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheMonitorActiveTasksButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToMonitorQueuesScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheMonitorQueuesButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToHistoryBuildsScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheHistoryBuildsButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToHistoryTasksScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheHistoryTasksButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsStampedeServerScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheSettingsStampedeServerButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsRepositoriesScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheSettingsRepositoriesButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsNotificationsScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheSettigsNotificationsButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsInfoScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheMonitorSectionIsVisible()
        thenTheSettingsInfoButtonIsDisplayed()
    }
}
