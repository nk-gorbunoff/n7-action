//
//  Logger.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

struct Logger {
    // MARK: - Properties
    private let subject: String
    
    // MARK: - Init
    init(subject: String) {
        self.subject = subject
    }
    
    // MARK: - Public methods
    func failure(_ message: String, level: LogLevel = .main) {
        log(message: message, kind: .error, level: level)
    }
    
    func info(_ message: String, level: LogLevel = .main) {
        log(message: message, kind: .info, level: level)
    }
    
    func success(_ message: String, level: LogLevel = .main) {
        log(message: message, kind: .success, level: level)
    }
    
    // MARK: - Private methods
    private func log(message: String, kind: Kind, level: LogLevel) {
        let prefix: String
        switch kind {
        case .error: prefix = "⛔️[\(subject)] "
        case .info: prefix = "ℹ️"
        case .success: prefix = "✅[\(subject)] "
        }
        let formattedMessage: String = message.replacingOccurrences(of: "\n", with: "\n\(prefix)")
        print(prefix + formattedMessage)
    }
}

// MARK: - Kind
extension Logger {
    enum Kind {
        case error
        case info
        case success
    }
}

// MARK: - LogLevel
extension Logger {
    public enum LogLevel {
        case main
        case verbose
    }
}
