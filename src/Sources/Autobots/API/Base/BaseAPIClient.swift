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

class BaseAPIClient {
    // MARK: - Properties
    let logger: Logger
    
    // MARK: - Init
    init(logger: Logger) {
        self.logger = logger
    }
    
    // MARK: - Public methods
    func perform(_ request: BaseRequest) async throws {
       try await performDataTask(with: request)
    }
    
    func performWithOutput<T: Decodable>(_ request: BaseRequest) async throws -> T {
        let data: Data = try await performDataTask(with: request)
        do {
            let object: T = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            logger.failure("Error decoding data.\n\(getRequestDetails(request))\nError:\n\(error)")
            throw APIError.decodingDataFailed
        }
    }
        
    // MARK: - Private methods
    @discardableResult
    private func performDataTask(with request: BaseRequest) async throws -> Data {
        let requestDetails: String = getRequestDetails(request)
        do {
            let data = try await URLSession.shared.data(from: request.asURLRequest()).0
            logger.info("Response was received.\n\(requestDetails)\n\(getResponseDetails(from: data))", level: .verbose)
            return data
        } catch {
            logger.failure("Error was received:\n\(requestDetails)\nError:\n\(error)")
            throw error
        }
        
    }
    private func getRequestDetails(_ request: BaseRequest) -> String {
        let body: String = request.asURLRequest().httpBody.map { String(data: $0, encoding: .utf8) ?? "" } ?? ""
        return "URL:\n\(request.asURLRequest().url?.absoluteString ?? "")\nBody:\n\(body)"
    }
    private func getResponseDetails(from data: Data) -> String {
        String(data: data, encoding: .utf8).map { "Response:\n\($0)" } ?? ""
    }
}
