//
//  Main.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 26.06.2023.
//

import Foundation

@main
struct Main {
    static func main() async {
        let logger: Logger = .init(subject: #function)
        let environment: Environment = ProcessInfo.processInfo.environment
        
        guard let inputData: InputData = .init(environment: environment) else {
            logger.failure("Failed to receive input data or unknown trigger: \(environment)")
            return
        }
        
//        switch triggerEvent {
//        case .createPullRequest:
//            await NewPullRequestNotificationAction().run(with: inputData)
//        case .schedule:
//            await RemindToCheckPullRequestsList().run(with: inputData)
//        }
        let client = GithubAPIClient(token: inputData.githubToken, logger: logger)
        do {
            let prs = try await client.getPullRequestsList(repo: inputData.githubRepository)
            for pr in prs {
                try await client.getReviews(by: pr.number, repo: inputData.githubRepository)
            }
        } catch {
            print("ERRRROR \(error)")
        }
    }
}
