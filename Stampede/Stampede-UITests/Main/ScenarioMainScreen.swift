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
        andTheHistorySectionIsVisible()
        thenTheHistoryBuildsButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToHistoryTasksScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheHistorySectionIsVisible()
        thenTheHistoryTasksButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsStampedeServerScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheSettingsSectionIsVisible()
        thenTheSettingsStampedeServerButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsRepositoriesScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheSettingsSectionIsVisible()
        thenTheSettingsRepositoriesButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsNotificationsScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheSettingsSectionIsVisible()
        thenTheSettigsNotificationsButtonIsDisplayed()
    }

    func testMainScreenContainsRouteToSettingsInfoScreen() throws {
        givenTheMainScreenIsDisplayed()
        andTheSettingsSectionIsVisible()
        thenTheSettingsInfoButtonIsDisplayed()
    }
}
