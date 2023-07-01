//
//  PullRequestNotificationAction.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

final class PullRequestNotificationAction: BaseAction {
    override func run(with inputData: InputData) async {
        let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
        let slackAPIClient: SlackAPIClient = SlackAPIClient(token: inputData.slackBotAuthToken, logger: logger)
        
        do {
            // Получить инфу о пул реквесте
            guard let prNumber: String = inputData.githubPullRequestNumber else {
                logger.failure("Couldn't get a pull request number")
                return
            }
            let pullRequest: PullRequest = try await githubAPIClient.getPullRequestInfo(by: prNumber, in: inputData.githubRepository)
            // Получить список юзеров в группе ios
            // Получить инфу о каждом юзере
            // Смапить до модельки для отправки сообщения
            // Отправить сообщения всем юзерам
            logger.success("Notification sent successfully")
        } catch {
            logger.failure("Failed to send notification\nError:\(error)")
        }
        
    }
}
