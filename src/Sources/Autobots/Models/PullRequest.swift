//
//  PullRequest.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 30.06.2023.
//

import Foundation

struct PullRequest {
    let number: String
    let url: String
    let title: String
    var author: String
    var reviewers: [String]
    
    mutating func tryToRewrite(with slackUsers: [SlackUser]) {
        for (index, user) in slackUsers.enumerated() {
            if user.name == author {
                 author = user.name
            } else if reviewers.contains(author) {
                reviewers[index] = user.name
            }
        }
    }
}
