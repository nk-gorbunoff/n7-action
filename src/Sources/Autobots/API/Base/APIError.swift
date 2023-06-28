//
//  APIError.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 28.06.2023.
//

import Foundation

enum APIError: Error {
    case invalidURLResponse
    case missingResponseData
    case decodingDataFailed
}
