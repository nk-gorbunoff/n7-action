//
//  BaseAPIClient.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

public enum APIError: Error {
    case resolvingURLError(String)
    case baseError
}

public class BaseAPIClient {
    // MARK: - Properties
    private let logger: Logger
    
    // MARK: - Init
    init(logger: Logger) {
        self.logger = logger
    }
    
    // MARK: - Public methods
    public func performDataTask(for request: Request) async throws {
       let data = try await performDataTask(with: request)
        if let responseString = String(data: data, encoding: .utf8) {
            print("Slack response: \(responseString)")
        }
    }
        
    // MARK: - Private methods
    private func performDataTask(with request: Request) async throws -> Data {
        try await URLSession.shared.data(from: request).0
    }
}

struct Response: Codable {
    let ok: String
}
