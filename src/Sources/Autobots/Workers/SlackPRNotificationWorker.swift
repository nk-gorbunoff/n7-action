//
//  SlackPRNotificationWorker.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

public class Worker {
    var logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
}

public final class SlackPRNotificationWorker: Worker {
    func work(with inputData: InputData) {
        let slackAPIClient: SlackAPIClient = .init(token: inputData.slackBotAuthToken, logger: logger)
        Task {
            do {
                try await slackAPIClient.postMessage("WAZAAAAP", toChannel: inputData.slackChannelId)
                logger.info("СООБЩЕНИЕ УСПЕШНО ОТПРАВЛЕНО")
            } catch {
                logger.failure("НЕ УДАЛОСЬ ОТПРАВИТЬ СООБЩЕНИЕ: \(error)")
            }
        }
    }
}
