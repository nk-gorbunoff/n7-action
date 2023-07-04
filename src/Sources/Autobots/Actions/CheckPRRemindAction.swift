//
//  RemindToCheckPullRequestsList.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 01.07.2023.
//

import Foundation

final class RemindToCheckPullRequestsList: BaseAction {
    override func run(with inputData: InputData) async {
//        let githubAPIClient: GithubAPIClient = .init(token: inputData.githubToken, logger: logger)
//        let slackAPIClient: SlackAPIClient = .init(token: inputData.slackBotAuthToken, logger: logger)
//        
//        do {
//            ///Получить список ПРов
//            let pullRequestList: [PullRequest] = try await githubAPIClient.getPullRequestsList(repo: inputData.githubRepository)
//            ///Получить юзеров
//            let slackUsers: [SlackUser] = try await slackAPIClient.getUsers(
//                inUserGroup: inputData.slackUserGroupId,
//                withGithubField: inputData.slackFieldId
//            )
//            ///Пройтись по каждому ПР и найти авторов и ревьюеров
//            for var pullRequest in pullRequestList {
//                pullRequest.tryToRewrite(with: slackUsers)
//            }
//            ///Создать сообщение
//            let message: String = SlackMessageConstructor().pullRequestsListMessage(with: pullRequestList)
//            ///Отправить общее сообщение
//            try await slackAPIClient.postMessage(message, to: inputData.slackChannelId)
//            logger.success("")
//        } catch {
//            logger.failure("")
//        }
    }
}
