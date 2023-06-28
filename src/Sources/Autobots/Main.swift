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
        let logger: Logger = .init()
        
        let slackToken = "xoxb-5367541263360-5350935183443-8Nt7OBgE5TxLqN6kGq8Z9TSQ"
        let channelID = "C05A0SCBB45"
        let message = "ААААААААА"
        
                
        do {
            try await SlackAPIClient(token: slackToken, logger: logger).postMessage(message, toChannel: channelID)
            print("Сообщение успешно отправлено в Slack.")
        } catch {
            print("Ошибка при отправке сообщения в Slack: \(error)")
        }
    }

}
