//
//  InputData.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 28.06.2023.
//

import Foundation

typealias Environment = [String: String]

// MARK: -
struct InputData {
    //Github
    let githubEventName: String
    let githubToken: String
    let githubRepository: String
    let githubPullRequestNumber: String?
    
    //Slack
    let slackBotAuthToken: String
    let slackChannelId: String
    let slackUserGroupId: String
        
    // MARK: - Init
    init?(environment: Environment) {
        guard let githubEventName: String = environment["GITHUB_EVENT_NAME"],
              let githubToken: String = environment["INPUT_GITHUB_TOKEN"],
              let githubRepository: String = environment["GITHUB_REPOSITORY"],
              let slackBotAuthToken: String = environment["INPUT_SLACK_BOT_AUTH_TOKEN"],
              let slackChannelId: String = environment["INPUT_SLACK_CHANNEL_ID"],
              let slackUserGroupId: String = environment["INPUT_SLACK_USER_GROUP_ID"] else {
            return nil
        }
        
        self.githubEventName = githubEventName
        self.githubToken = githubToken
        self.githubRepository = githubRepository
        self.githubPullRequestNumber = environment["INPUT_PULL_REQUEST_NUMBER"]
        self.slackBotAuthToken = slackBotAuthToken
        self.slackChannelId = slackChannelId
        self.slackUserGroupId = slackUserGroupId
    }
}

// MARK: -
enum TriggerEvent: String {
    case schedule = "schedule"
    case createPullRequest = "pull_request"
}
