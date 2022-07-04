//
//  RepositoryListFixture.swift
//  Stampede
//
//  Created by David House on 10/12/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

class RepositoryListFixtureProvider: RepositoryListProvider {
    func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
        return []
    }
    
    func fileExists(atPath path: String) -> Bool {
        return true
    }
    
    func write(_ data: Data, to: URL) throws {
        
    }
    
    func read(from: URL) throws -> Data {
        return Data()
    }
}
