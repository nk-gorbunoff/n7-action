//
//  main.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 26.06.2023.
//

import Foundation

@main
struct Main {
    static func main() async {
        let logger: Logger = .init(subject: #function)
        let invironment: Environment = ProcessInfo.processInfo.environment
        
        guard let inputData: InputData = .init(environment: invironment),
              let triggerEvent: TriggerEvent = .init(rawValue: inputData.githubEventName) else {
            logger.failure("Failed to receive input data or unknown trigger: \(invironment)")
            return
        }
        
        switch triggerEvent {
        case .createPullRequest:
            await PullRequestNotificationAction().run(with: inputData)
        case .schedule:
            break
        }
    }
    
}
