//
//  SlackPRNotificationWorker.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

public class Worker {
    var logger: Logger
    init() {
        self.logger = .init(object: "\(Self.self)")
    }
}

public final class SlackPRNotificationWorker: Worker {
    func work(with inputData: InputData) async {
        let slackAPIClient: SlackAPIClient = .init(token: inputData.slackBotAuthToken, logger: logger)
        do {
            try await slackAPIClient.postMessage("WAZZAP", toChannel: inputData.slackChannelId)
            logger.success("Post message complete")
        } catch {
            logger.failure("Post message failed")
        }
    }
}
