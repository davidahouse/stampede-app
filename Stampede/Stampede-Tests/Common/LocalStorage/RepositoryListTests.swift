//
//  RepositoryListTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryListTests: XCTestCase {

    class MockRepositoryListProvider: RepositoryListProvider {
        
        var urls: [URL] = [URL(fileURLWithPath: "/somePath")]
        var exists: Bool = true
        var writeError: Error?
        var readError: Error?
        var readData: Data?
        var writeCalled: Bool = false
        var readCalled: Bool = false
        
        func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
            return urls
        }
        
        func fileExists(atPath path: String) -> Bool {
            return exists
        }
        
        func write(_ data: Data, to: URL) throws {
            writeCalled = true
            if let error = writeError {
                throw error
            }
        }
        
        func read(from: URL) throws -> Data {
            readCalled = true
            if let data = readData {
                return data
            } else if let error = readError {
                throw error
            } else {
                return Data()
            }
        }
    }
    
    var provider: MockRepositoryListProvider!
    
    override func setUp() {
        provider = MockRepositoryListProvider()
    }
    
    func testProvidingRepositoriesInInitializerReturnsTheSame() {
        let list = RepositoryList(repositories: Repository.someRepositories, provider: provider)
        let expectation = XCTestExpectation(description: "waiting on publisher")
        let publisher = list.fetchRepositoriesPublisher()
        _ = publisher.sink { (_) in
           
        } receiveValue: { (repositories) in
            XCTAssertEqual(repositories, Repository.someRepositories)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
 
    func testInitializerReadsFromFileIfNotProvidedInInitializer() {
        _ = RepositoryList(provider: provider)
        XCTAssertTrue(provider.readCalled)
    }
    
    func testAddingRepositoryWritesToFile() {
        let list = RepositoryList(provider: provider)
        list.addRepository(repository: Repository.someRepository)
        XCTAssertTrue(provider.writeCalled)
    }
    
    func testRemovingRepositoryWritesToFile() {
        let list = RepositoryList(repositories: Repository.someRepositories, provider: provider)
        list.removeRepository(repository: Repository.someRepository)
        XCTAssertTrue(provider.writeCalled)
    }
    
    func testLoadWithNoFileSuppliesEmptyRepositories() {
        provider.exists = false
        let list = RepositoryList(provider: provider)
        expectEmptyRepositoriesList(list)
    }
    
    func testCanHandleNotFindingUsersDocumentsPath() {
        provider.urls = []
        let list = RepositoryList(provider: provider)
        list.addRepository(repository: Repository.someRepository)
        list.removeRepository(repository: Repository.someRepository)
        expectEmptyRepositoriesList(list)
    }
    
    private func expectEmptyRepositoriesList(_ list: RepositoryList) {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        let publisher = list.fetchRepositoriesPublisher()
        _ = publisher.sink { (_) in
           
        } receiveValue: { (repositories) in
            XCTAssertEqual(repositories.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
