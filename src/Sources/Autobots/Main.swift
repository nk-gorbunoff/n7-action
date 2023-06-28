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
        let logger: Logger = .init(object: "MAIN")
        guard let inputData: InputData = .init(environment: ProcessInfo.processInfo.environment) else {
            logger.failure("не удалось получить данные")
            return
        }

        await SlackPRNotificationWorker().work(with: inputData)
    }
}
