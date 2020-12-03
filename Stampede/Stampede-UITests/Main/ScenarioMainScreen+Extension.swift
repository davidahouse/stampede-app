//
//  ScenarioMainScreen+Extension.swift
//  Stampede-UITests
//
//  Created by David House on 9/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

extension ScenarioMainScreen {

    // GIVEN ACCESSORS

    func givenTheMainScreenIsDisplayed() {
        waitForStaticText("Stampede")
    }

    func andTheRepositoriesSectionIsVisible() {
        waitForStaticText("REPOSITORIES")
    }

    func andTheMonitorSectionIsVisible() {
        waitForStaticText("MONITOR")
    }

    func andTheHistorySectionIsVisible() {
        waitForStaticText("HISTORY")
    }

    func andTheSettingsSectionIsVisible() {
        waitForStaticText("SETTINGS")
    }

    // THEN ACCESSORS

    func thenTheFavoriteRepositoryIsDisplayed() {
        waitForButton("davidahouse-some-repository")
    }

    func thenTheMonitorActiveBuildsButtonIsDisplayed() {
        waitForButton("Active Builds")
    }

    func thenTheMonitorActiveTasksButtonIsDisplayed() {
        waitForButton("Active Tasks")
    }

    func thenTheMonitorQueuesButtonIsDisplayed() {
        waitForButton("Queues")
    }

    func thenTheHistoryBuildsButtonIsDisplayed() {
        waitForButton("Builds")
    }

    func thenTheHistoryTasksButtonIsDisplayed() {
        waitForButton("Tasks")
    }

    func thenTheSettingsStampedeServerButtonIsDisplayed() {
        waitForButton("Stampede Server")
    }

    func thenTheSettingsRepositoriesButtonIsDisplayed() {
        waitForButton("Repositories")
    }

    func thenTheSettigsNotificationsButtonIsDisplayed() {
        waitForButton("Notifications")
    }

    func thenTheSettingsInfoButtonIsDisplayed() {
        waitForButton("Info")
    }
}
