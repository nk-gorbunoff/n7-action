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
    // MARK: - Init
    init(host: String = "https://slack.com",
         token: String,
         logger: Logger) {
        self.host = host
        self.token = token
        super.init(logger: logger)
    }
    
    // MARK: - Public methods
    func postMessage(_ blocks: String, toChannel channelId: String) async throws {
        let request: BaseRequest = .init(
            host: host,
            path: "/api/chat.postMessage",
            method: .post,
            parameters: [
                "channel": channelId,
                "blocks": blocks
            ],
            headers: [
                .authorization(token: token),
                .contentType
            ]
        )
        
        try await perform(request)
    }
}
