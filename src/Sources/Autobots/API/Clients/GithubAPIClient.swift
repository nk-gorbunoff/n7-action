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
    
    // MARK: - Init
    init(host: String = "https://api.github.com",
         token: String,
         logger: Logger) {
        self.host = host
        self.token = token
        super.init(logger: logger)
    }
    
    // MARK: - Public methods
    func getPullRequestsList(owner: String, repo: String) async throws {
        let request: BaseRequest = .init(
            host: host,
            path: "/repos/\(repo)/pulls",
            method: .get,
            headers: [
                .authorization(token: token),
                .accept,
                .githubAPIVersion
            ]
        )
        
        try await perform(request)
    }
    
    func getPullRequestInfo(owner: String, repo: String, pullRequestNumber: String) async throws {
        let request: BaseRequest = .init(
            host: host,
            path: "/repos/\(repo)/pulls/\(pullRequestNumber)",
            method: .get,
            headers: [
                .authorization(token: token),
                .accept,
                .githubAPIVersion
            ]
        )
        
        try await perform(request)
    }
}
