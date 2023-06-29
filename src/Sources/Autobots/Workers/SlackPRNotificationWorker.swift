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
        self.logger = .init(subject: "\(Self.self)")
    }
}

public final class SlackPRNotificationWorker: Worker {
    func work(with inputData: InputData) async {
        let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
        do {
            try await githubAPIClient.getPullRequestsList(owner: inputData.githubRepositoryOwner, repo: inputData.githubRepository)
            logger.success("ПРЫ ИЗ ГИТХАБА ПРИШЛИ")
        } catch {
            logger.success("ПРЫ ИЗ ГИТХАБА НЕ ПРИШЛИ")
        }
        
        do {
            if let pullRequestNumber: String = inputData.githubPullRequestNumber {
                try await githubAPIClient.getPullRequestInfo(
                    owner: inputData.githubRepositoryOwner,
                    repo: inputData.githubRepository,
                    pullRequestNumber: pullRequestNumber
                )
                logger.success("ПР ИНФО ИЗ ГИТХАБА ПРИШЕЛ")
            } else {
                logger.failure("НОМЕР ПРА НЕ АЛЁ")
            }
        } catch {
            logger.failure("ПР ИНФО ИЗ ГИТХАБА ПРИШЕЛ")
        }
        
        
        
//        let slackAPIClient: SlackAPIClient = .init(token: inputData.slackBotAuthToken, logger: logger)
//        do {
//            let message = ""
//            try await slackAPIClient.postMessage(message, toChannel: inputData.slackChannelId)
//            logger.success("Sending message in Slack was succeeded")
//        } catch {
//            logger.failure("Sending message in Slack was failed")
//        }
    }
}
