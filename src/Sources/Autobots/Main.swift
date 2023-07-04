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
        
        guard let inputData: InputData = .init(environment: environment),
              let triggerEvent: TriggerEvent = .init(rawValue: inputData.githubEventName) else {
            logger.failure("Failed to receive input data or unknown trigger: \(environment)")
            return
        }
        
//        switch triggerEvent {
//        case .createPullRequest:
//            await NewPullRequestNotificationAction().run(with: inputData)
//        case .schedule:
//            await RemindToCheckPullRequestsList().run(with: inputData)
//        }
        
        try? await GithubAPIClient(token: inputData.githubToken, logger: logger).getPullRequestsList(repo: inputData.githubRepository)
    }
}
