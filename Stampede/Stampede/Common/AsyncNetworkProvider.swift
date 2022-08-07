//
//  AsyncNetworkProvider.swift
//  Stampede
//
//  Created by David House on 6/19/22.
//  Copyright © 2022 David House. All rights reserved.
//

import Foundation
import HouseKit

@available(iOS 13.0, tvOS 13.0, *)
open class AsyncNetworkProvider {
    let session: URLSession

    public init(session: URLSession? = nil) {
        if let session = session {
            self.session = session
        } else {
            self.session = URLSession(configuration: URLSessionConfiguration.default)
        }
    }

    public func request<T: Decodable>(url: URL) async throws -> T {
        debugPrint(">>> \(url)")
        do {
            let (data, response) = try await session.data(for: URLRequest(url: url))
            guard let response = response as? HTTPURLResponse else {
                throw ServiceError.network(description: "No response")
            }

            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder.dateParsingDecoder.decode(T.self, from: data)
                    return decodedResponse
                } catch {
                    if let decodingError = error as? DecodingError {
                        switch decodingError {
                        case .dataCorrupted(let context):
                            throw ServiceError.parsing(description: "Data corrupted error \(context.debugDescription)")
                        case .typeMismatch(let typeMismatch, let context):
                            throw ServiceError.parsing(description: "Type \(typeMismatch) mismatch: \(context.debugDescription) in path: \(context.codingPath)")
                        default:
                            throw ServiceError.parsing(description: "\(decodingError)")
                        }
                    } else {
                        throw ServiceError.parsing(description: error.localizedDescription)
                    }
                }
            case 401:
                throw ServiceError.network(description: "Unauthorizied")
            default:
                throw ServiceError.network(description: "Error: \(response.statusCode)")
            }
        } catch {
            throw error
        }
    }

}

extension JSONDecoder {
    static let dateParsingDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Constants.iso8601Full)
        return decoder
    }()
}
