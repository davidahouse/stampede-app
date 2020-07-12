//
//  StampedeServiceFixtures.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public enum StampedeServiceFixtures {

    public static var mockConfiguration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        return configuration
    }
    public static let mockSession = URLSession(configuration: StampedeServiceFixtures.mockConfiguration)
    public static let mockService = StampedeService(host: "http://mockservice", session: StampedeServiceFixtures.mockSession)
    #if DEBUG
    public static let mockPreviewService = StampedeService(host: "http://mockservice", session: StampedeServiceFixtures.mockSession, provider: StampedeServicePreviewProvider())
    #endif
//    static let mockEmptyService = StampedeService(host: "http://mockservice", session: StampedeServiceFixtures.mockSession, provider: StampedeServiceEmptyProvider())
}

@available(iOS 13.0, *)
public class URLProtocolMock: URLProtocol {

    static var activeTasksCount = 0
    
    public override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    public override class func canInit(with task: URLSessionTask) -> Bool {
        return true
    }

    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    public override func startLoading() {
        
        guard let url = request.url else {
            return
        }

        #if DEBUG

        let rawData: Data = {
            switch url.path {
            case "/api/repositories":
                return encodedFixture(Repository.someRepositories)
            case "/api/monitor/activeTasks":
                URLProtocolMock.activeTasksCount += 1
                if URLProtocolMock.activeTasksCount > 3 {
                    return encodedFixture(TaskStatus.activeTasks)
                } else {
                    return encodedFixture(TaskStatus.noTasks)
                }
            case "/api/recentBuilds":
                return encodedFixture(BuildStatus.recentBuilds)
            case "/api/monitor/workerStatus":
                return encodedFixture(WorkerStatus.workerStatuses)
            case "/api/monitor/queueSummary":
                return encodedFixture(QueueSummary.someSummaries)
            case "/api/admin/tasks":
                return encodedFixture(Task.someTasks)
            case "/api/admin/configDefaults":
                return encodedFixture(ConfigDefaults.someDefaults)
            case "/api/admin/configOverrides":
                return encodedFixture(ConfigOverrides.someOverrides)
            case "/api/admin/queues":
                return encodedFixture(Queue.someQueues)
            case "/api/history/hourlySummary":
                return encodedFixture(HourlySummary.someSummaries)
            default:
                print("No mocked data found for path: \(url.path)")
                return Data()
            }
        }()
        
        self.client?.urlProtocol(self, didReceive: HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [:])!, cacheStoragePolicy: .allowed)
        self.client?.urlProtocol(self, didLoad: rawData)

        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
        #else
        return
        #endif
    }

    public override func stopLoading() { }
    
    private func encodedFixture<T: Encodable>(_ encodable: T) -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(Constants.iso8601Full)
        do {
            let data = try encoder.encode(encodable)
            return data
        } catch {
            print("Exception trying to generate data: \(error.localizedDescription)")
            return Data()
        }
    }
}
