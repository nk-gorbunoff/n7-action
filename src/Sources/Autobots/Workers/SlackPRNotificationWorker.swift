//
//  SlackPRNotificationWorker.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

final class SlackPRNotificationWorker: Worker {
    func work(with inputData: InputData) async {
        do {
            let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
            let pr = try await githubAPIClient.getPullRequestInfo(by: inputData.githubPullRequestNumber ?? "", repo: inputData.githubRepository)
            logger.success("ПР ИНФО ИЗ ГИТХАБА ПРИШЕЛ: \(pr)")
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
