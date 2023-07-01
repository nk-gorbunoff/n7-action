//
//  SlackAPIClient.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

final class SlackAPIClient: BaseAPIClient {
    // MARK: - Properties
    private let host: String
    private let token: String
    private var headers: Request.Headers {
        [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
    }
    // MARK: - Init
    init(host: String = "https://slack.com",
         token: String,
         logger: Logger) {
        self.host = host
        self.token = token
        super.init(logger: logger)
    }
    
    // MARK: - Public methods
    func postMessage(_ message: String, to chatID: String) async throws {
        let parameters: [Request.Parameters] = [
            .init(context: .body, dictionary: ["channel": chatID, "blocks": message])
        ]
        let request: Request = .init(
            host: host,
            path: "/api/chat.postMessage",
            method: .post,
            headers: headers,
            parameters: parameters
        )
        
        try await perform(request)
    }
    
    func getUsersList(byUserGroup groupID: String) async throws -> [String] {
        let parameters: [Request.Parameters] = [
            .init(context: .url, dictionary: ["usergroup": groupID])
        ]
        let request: Request = .init(
            host: host,
            path: "/api/usergroups.users.list",
            method: .get,
            headers: headers,
            parameters: parameters
        )
        
        let response: GetUsersListResponse = try await perform(request, withResponse: GetUsersListResponse.self)
        return response.users ?? []
    }
    
    func getUser(byID userID: String, withGithubField fieldId: String) async throws -> SlackUser? {
        let parameters: [Request.Parameters] = [
            .init(context: .url, dictionary: ["user": userID])
        ]
        let request: Request = .init(
            host: host,
            path: "/api/users.profile.get",
            method: .get,
            headers: headers,
            parameters: parameters
        )
        
        let response: GetUsersProfileResponse = try await perform(request, withResponse: GetUsersProfileResponse.self)
        guard let name: String = response.profile?.displayName,
              let githubProfile: String = response.profile?.fields?[fieldId]?.value else {
            return nil
        }
        
        return .init(id: userID, name: name, githubProfile: githubProfile)
    }
}


// MARK: - GetUsersListResponse
extension SlackAPIClient {
    struct GetUsersListResponse: Decodable {
        let users: [String]?
    }
}

// MARK: - GetUsersProfileResponse
extension SlackAPIClient {
    struct GetUsersProfileResponse: Decodable {
        let profile: SlackProfile?
    }
}

extension SlackAPIClient.GetUsersProfileResponse {
    struct SlackProfile: Decodable {
        let displayName: String?
        let fields: [String: Field]?
        
        enum CodingKeys: String, CodingKey {
            case displayName = "display_name"
            case fields
        }
    }
    
    struct Field: Decodable {
        let value: String?
    }
}

