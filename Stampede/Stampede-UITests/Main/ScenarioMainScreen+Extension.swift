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
        waitForButton("REPOSITORIES")
    }

    func andTheMonitorSectionIsVisible() {
        waitForButton("MONITOR")
    }

    // THEN ACCESSORS

    func thenTheFavoriteRepositoryIsDisplayed() {
        waitForButton("davidahouse-stampede-server")
    }

    func thenTheMonitorLiveButtonIsDisplayed() {
        waitForButton("monitor-live")
    }

    func thenTheMonitorActiveBuildsButtonIsDisplayed() {
        waitForButton("monitor-active-builds")
    }

    func thenTheMonitorActiveTasksButtonIsDisplayed() {
        waitForButton("monitor-active-tasks")
    }

    func thenTheMonitorQueuesButtonIsDisplayed() {
        waitForButton("monitor-queues")
    }

    func thenTheHistoryBuildsButtonIsDisplayed() {
        waitForButton("history-builds")
    }

    func thenTheHistoryTasksButtonIsDisplayed() {
        waitForButton("history-tasks")
    }

    func thenTheSettingsStampedeServerButtonIsDisplayed() {
        waitForButton("settings-stampede-server")
    }

    func thenTheSettingsRepositoriesButtonIsDisplayed() {
        waitForButton("settings-repositories")
    }

    func thenTheSettigsNotificationsButtonIsDisplayed() {
        waitForButton("settings-notifications")
    }

    func thenTheSettingsInfoButtonIsDisplayed() {
        waitForButton("settings-info")
    }
}
