//
//  Worker.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 30.06.2023.
//

import Foundation

class BaseAction {
    var logger: Logger
    
    init() {
        self.logger = .init(subject: "\(Self.self)")
    }
    
    func run(with inputData: InputData) async {
        ///override
    }
}
