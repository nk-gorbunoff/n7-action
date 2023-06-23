//
//  Main.swift
//  PRManager
//
//  Created by Nikita Gorbunov on 22.06.2023.
//

import Foundation

@main
public struct Main {
    typealias Environment = [String: String]
    
    public static func main() {
        let environment: Environment = ProcessInfo.processInfo.environment
//        guard let slackChannelId: String = environment["INPUT_SLACK_CHANNEL_ID"],
//              let slackBotAuthToken: String = environment["INPUT_SLACK_BOT_AUTH_TOKEN"] else {
//            print("НЕ МОГУ ПОЛУЧИТЬ ВХОДНЫЕ ДАННЫЕ")
//            return
//        }
        print(environment)
        print("ОТПРАВИЛИ СООБЩЕНИЕ В СЛУК")
    }
    
//    private static func sendMessageToSlack(channelId: String, message: String, slackBotAuthToken: String) async throws {
//        guard let url = URL(string: "https://slack.com/api/chat.postMessage") else {
//            print("Ошибка: Неверный URL для Slack API")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        request.addValue("Bearer \(slackBotAuthToken)", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let requestBody: [String: Any] = [
//            "channel": channelId,
//            "text": message
//        ]
//
//        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
//
//        let (data, _) = try await URLSession.shared.data(for: request)
//        if let response = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
//            if let error = response["error"] as? String {
//                throw NSError(domain: "Slack API Error", code: 0, userInfo: [NSLocalizedDescriptionKey: error])
//            } else {
//                print("Сообщение успешно отправлено в Slack")
//            }
//        } else {
//            throw NSError(domain: "Slack API Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response from Slack API"])
//        }
//    }
}


