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
//        let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
//        do {
//            try githubAPIClient.getPullRequestsList(owner: inputData.githubRepoOwner, repo: inputData.githubRepoName)
//        } catch {
//
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
