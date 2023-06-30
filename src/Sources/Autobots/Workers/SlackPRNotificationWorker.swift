//
//  SlackPRNotificationWorker.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

final class SlackPRNotificationWorker: Worker {
    func work(with inputData: InputData) async {
        let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
        do {
            let prs = try await githubAPIClient.getPullRequestsList(repo: inputData.githubRepository)
            logger.success("ПРЫ ИЗ ГИТХАБА ПРИШЛИ \(prs)")
        } catch {
            logger.failure("ПРЫ ИЗ ГИТХАБА НЕ ПРИШЛИ")
        }
        
//        do {
//            if let pullRequestNumber: String = inputData.githubPullRequestNumber {
//                try await githubAPIClient.getPullRequestInfo(repo: inputData.githubRepository, PRNumber: pullRequestNumber)
//                logger.success("ПР ИНФО ИЗ ГИТХАБА ПРИШЕЛ")
//            } else {
//                logger.failure("НОМЕР ПРА НЕ АЛЁ")
//            }
//        } catch {
//            logger.failure("ПР ИНФО ИЗ ГИТХАБА ПРИШЕЛ")
//        }
        
        
        
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
