//
//  SlackMessageConstructor.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 29.06.2023.
//

import Foundation

struct SlackMessageConstructor {
    // MARK: - pullRequestCreatedMessage
    func pullRequestCreatedMessage(with pr: PullRequest) -> String {
        """
        [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": "*PR \(pr.number) was created:*\n<\(pr.url)|\(pr.title)>"
                }
            },
            {
                "type": "section",
                "fields": [
                    {
                        "type": "mrkdwn",
                        "text": "*Reviewers*:\n\(pr.reviewers.joined(separator: "\n"))"
                    },
                    {
                        "type": "mrkdwn",
                        "text": "*Author:*\n\(pr.author)"
                    }
                ]
            },
            {
                "type": "divider"
            }
        ]
        """
    }
    // MARK: - pullRequestsListMessage
    func pullRequestsListMessage(with prs: [PullRequest]) -> String {
        ""
    }
}




