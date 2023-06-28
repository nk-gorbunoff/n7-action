//
//  URLSession+LinuxOS.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 28.06.2023.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// An extension that provides async support for fetching a URL
///
/// Needed because the Linux version of Swift does not support async URLSession yet.
extension URLSession {
    /// A reimplementation of `URLSession.shared.data(from: url)` required for Linux
    ///
    /// - Parameter request: The URLRequest for which to load data.
    /// - Returns: Data and URLResponse.
    ///
    /// - Usage:
    ///
    ///     let (data, response) = try await URLSession.shared.asyncData(from: url)
    func data(from request: URLRequest) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: request) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    continuation.resume(throwing: APIError.invalidURLResponse)
                    return
                }
                guard let data = data else {
                    continuation.resume(throwing: APIError.missingResponseData)
                    return
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}

