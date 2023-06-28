//
//  BaseAPIClient.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

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
    public func performDataTask(for request: URLRequest) async throws {
        try await performDataTask(with: request)
    }
        
    // MARK: - Private methods
    @discardableResult
    private func performDataTask(with request: URLRequest) async throws -> Data {
        try await URLSession.shared.data(from: request).0
    }
}
