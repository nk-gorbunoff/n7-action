//
//  SlackMessageConstructor.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 29.06.2023.
//

import Foundation

struct SlackMessageConstructor {    
    struct PullRequest {
        let number: String
        let url: String
        let title: String
        let reviewers: String
        let author: String
    }
    
    func constructBlock(with pr: PullRequest) -> String {
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
                        "text": "*Reviewers*:\n\(pr.reviewers)"
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
}




