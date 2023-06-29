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
        let logger: Logger = .init(subject: "MAIN")
        guard let inputData: InputData = .init(environment: ProcessInfo.processInfo.environment) else {
            logger.failure("Failed to receive input data: \(ProcessInfo.processInfo.environment)")
            return
        }
        
        switch inputData.githubEvent {
        case .schedule:
            logger.success("РАСПИСАНИЕ")
        case .createPullRequest:
            logger.success("ПУЛЛ РЕКВЕСТИК")
        }

    }
}
