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
    let author: String
    let reviewers: [String]
}
