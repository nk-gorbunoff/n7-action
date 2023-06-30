//
//  GithubAPIClient.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 29.06.2023.
//

import Foundation

final class GithubAPIClient: BaseAPIClient {
    // MARK: - Properties
    private let host: String
    private let token: String
    private var headers: [BaseRequest.HeaderType] {
        [
            .authorization(token: token),
            .accept,
            .githubAPIVersion
        ]
    }
    
    // MARK: - Init
    init(host: String = "https://api.github.com",
         token: String,
         logger: Logger) {
        self.host = host
        self.token = token
        super.init(logger: logger)
    }
    
    // MARK: - Public methods
    func getPullRequestsList(repo: String) async throws -> [PullRequest] {
        let request: BaseRequest = .init(
            host: host,
            path: "/repos/\(repo)/pulls",
            method: .get,
            headers: headers
        )
        
        return try await perform(request, withOutput: [PullRequest].self)
    }
    
    func getPullRequestInfo(by PRNumber: String, repo: String) async throws -> PullRequest {
        let request: BaseRequest = .init(
            host: host,
            path: "/repos/\(repo)/pulls/\(PRNumber)",
            method: .get,
            headers: headers
        )
        
        return try await perform(request, withOutput: PullRequest.self)
    }
}

// MARK: - Models
extension GithubAPIClient {
    struct PullRequest: Decodable {
        let number: Int
        let title: String
        let user: User
    }
    struct User: Decodable {
        let name: String
    }
}
