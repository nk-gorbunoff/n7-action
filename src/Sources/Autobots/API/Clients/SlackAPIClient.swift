//
//  SlackAPIClient.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

final class SlackAPIClient: BaseAPIClient {
    // MARK: - Properties
    private let baseURLString: String
    private let token: String
    // MARK: - Init
    init(baseURLString: String = "https://slack.com",
         token: String,
         logger: Logger) {
        self.baseURLString = baseURLString
        self.token = token
        super.init(logger: logger)
    }
    
    func postMessage(_ message: String, toChannel channelId: String) async throws {
        let request: BaseRequest = BaseRequest(
            host: baseURLString,
            path: "/api/chat.postMessage",
            method: .post,
            parameters: [
                "channel": channelId,
                "text": message
            ],
            headers: [
                .authorization(token: token),
                .contentType
            ]
        )
        try await perform(request)
    }
}
