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
    private let apiVersion: String
    private var headers: Request.Headers {
        [
            "Authorization": "Bearer \(token)",
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "\(apiVersion)"
        ]
    }
    
    // MARK: - Init
    init(host: String = "https://api.github.com",
         token: String,
         apiVersion: String = "2022-11-28",
         logger: Logger) {
        self.host = host
        self.token = token
        self.apiVersion = apiVersion
        super.init(logger: logger)
    }
    
    // MARK: - Public methods
    func getPullRequestsList(repo: String) async throws -> [PullRequest] {
        let request: Request = .init(
            host: host,
            path: "/repos/\(repo)/pulls",
            method: .get,
            headers: headers
        )
        
        let response: [GetPullRequestsListResponse] = try await perform(request, withResponse: [GetPullRequestsListResponse].self)
        
        return response.compactMap(map)
    }
    
    func getPullRequestInfo(by PRNumber: String, in repo: String) async throws -> PullRequest {
        let request: Request = .init(
            host: host,
            path: "/repos/\(repo)/pulls/\(PRNumber)",
            method: .get,
            headers: headers
        )
        
        let response: GetPullRequestsListResponse = try await perform(request, withResponse: GetPullRequestsListResponse.self)
        
        if let object: PullRequest = map(response) {
            return object
        } else {
            throw APIError.responseMappingError(response)
        }
    }
    
    func getReviews(by pr: String, repo: String) async throws {
        let request: Request = .init(
            host: host,
            path: "/repos/\(repo)/pulls/\(pr)/reviews",
            method: .get
        )
        
        try await perform(request)
    }
    
    // MARK: - Private methods
    private func map(_ response: GetPullRequestsListResponse) -> PullRequest? {
        guard let numberInt: Int = response.number,
              let url: String = response.url,
              let title: String = response.title,
              let author: String = response.user?.login,
              let reviewers: [String] = response.reviewers?.compactMap({ $0.login }) else {
                  return nil
              }
        
        return .init(
            number: String(numberInt),
            url: url,
            title: title,
            author: author,
            reviewers: reviewers
        )
    }
}

// MARK: - GetPullRequestsListResponse
extension GithubAPIClient {
    struct GetPullRequestsListResponse: Decodable {
        let url: String?
        let number: Int?
        let title: String?
        let user: User?
        let reviewers: [User]?
        
        enum CodingKeys: String, CodingKey {
            case url, number, title, user
            case reviewers = "requested_reviewers"
        }
    }
}

extension GithubAPIClient.GetPullRequestsListResponse {
    struct User: Decodable {
        let login: String?
    }
}
