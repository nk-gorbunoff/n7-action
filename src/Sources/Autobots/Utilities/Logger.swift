//
//  Logger.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation

public final class Logger {
    
    public func failure(_ object: Any) {
        log(object: object)
    }
    
    public func info(_ object: Any) {
        log(object: object)
    }
    
    
    private func log(object: Any) {
        print("\(object)")
    }
}
