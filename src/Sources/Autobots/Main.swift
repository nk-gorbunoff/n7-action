//
//  main.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 26.06.2023.
//

import Foundation

@main
public struct Main {
    public static func main() {
        
        guard let slackToken = ProcessInfo.processInfo.environment["INPUT_SLACK_BOT_AUTH_TOKEN"],
              let channelID = ProcessInfo.processInfo.environment["INPUT_SLACK_CHANNEL_ID"] else {
            print("ERROR ERROR")
            return
        }
        
        let message = "Hello, Slack!"
        API().postMessageToSlack(token: slackToken, channel: channelID, message: message)
    }
}


struct API {
    func postMessageToSlack(token: String, channel: String, message: String) {
        let url = URL(string: "https://slack.com/api/chat.postMessage")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters = [
            "token": token,
            "channel": channel,
            "text": message
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters)
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data,
                      let dataString = String(data: data, encoding: .utf8) {
                print("Response: \(dataString)")
            }
        }
        
        task.resume()
    }
}
