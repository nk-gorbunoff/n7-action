//
//  InputData.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 28.06.2023.
//

import Foundation

struct InputData {
    //Github
    let githubEvent: TriggerEvent    
    let githubToken: String
    let githubRepository: String
    let githubRepositoryOwner: String
    let githubPullRequestNumber: String?
    
    //Slack
    let slackBotAuthToken: String
    let slackChannelId: String
    
    init?(environment: [String: String]) {
        guard let githubEventName: String = environment["GITHUB_EVENT_NAME"],
              let githubEvent: TriggerEvent = .init(rawValue: githubEventName),
              let githubToken: String = environment["INPUT_GITHUB_TOKEN"],
              let githubRepository: String = environment["GITHUB_REPOSITORY"],
              let githubRepositoryOwner: String = environment["GITHUB_REPOSITORY_OWNER"],
              let slackBotAuthToken: String = environment["INPUT_SLACK_BOT_AUTH_TOKEN"],
              let slackChannelId: String = environment["INPUT_SLACK_CHANNEL_ID"] else {
            return nil
        }
        
        self.githubEvent = githubEvent
        self.githubToken = githubToken
        self.githubRepositoryOwner = githubRepositoryOwner
        self.githubRepository = githubRepository
        self.githubPullRequestNumber = environment["INPUT_PULL_REQUEST_NUMBER"]
        self.slackBotAuthToken = slackBotAuthToken
        self.slackChannelId = slackChannelId
    }
}
