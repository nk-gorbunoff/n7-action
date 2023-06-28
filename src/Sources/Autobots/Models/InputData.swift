//
//  InputData.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 28.06.2023.
//

import Foundation

struct InputData {
    let githubToken: String
    let slackBotAuthToken: String
    let slackChannelId: String
    
    init?(environment: [String: String]) {
        guard let githubToken: String = environment["INPUT_GITHUB_TOKEN"],
              let slackBotAuthToken: String = environment["SLACK_BOT_AUTH_TOKEN"],
              let slackChannelId: String = environment["SLACK_CHANNEL_ID"] else {
            return nil
        }
        self.githubToken = githubToken
        self.slackBotAuthToken = slackBotAuthToken
        self.slackChannelId = slackChannelId
    }
}
