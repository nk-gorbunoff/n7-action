//
//  PullRequestNotificationAction.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

final class NewPullRequestNotificationAction: BaseAction {
    override func run(with inputData: InputData) async {
//        let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
//        let slackAPIClient: SlackAPIClient = SlackAPIClient(token: inputData.slackBotAuthToken, logger: logger)
//        
//        do {
//            guard let prNumber: String = inputData.githubPullRequestNumber else {
//                logger.failure("Couldn't get a pull request number")
//                return
//            }
//            
//            let slackUsers: [SlackUser] = try await slackAPIClient.getUsers(inUserGroup: inputData.slackUserGroupId, withGithubField: inputData.slackFieldId)
//            var pullRequest: PullRequest = try await githubAPIClient.getPullRequestInfo(by: prNumber, in: inputData.githubRepository)
//            for (index, user) in slackUsers.enumerated() {
//                if user.name == pullRequest.author {
//                    pullRequest.author = user.name
//                } else if pullRequest.reviewers.contains(pullRequest.author) {
//                    pullRequest.reviewers[index] = user.name
//                }
//            }
//            let message: String = SlackMessageConstructor().pullRequestCreatedMessage(with: pullRequest)
//            try await slackAPIClient.postMessage(message, to: inputData.slackChannelId)
//            
//            logger.success("Notification sent successfully")
//        } catch {
//            logger.failure("Failed to send notification\nError:\(error)")
//        }
    }
}
