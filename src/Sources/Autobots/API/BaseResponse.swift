//
//  BaseResponse.swift
//  Autobots
//
//  Created by Nikita Gorbunov on 27.06.2023.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class BaseRequest {
    typealias Headers = [String: String]
    typealias Parameters = [String: Any]
    // MARK: - Properties
    private let host: String
    private var path: String
    private var method: HTTPMethod
    private var parameters: Parameters
    private var headersDict: Headers = [:]
    // MARK: - Init
    init(host: String,
         path: String,
         method: HTTPMethod,
         parameters: Parameters = [:],
         headers: [Header] = []) {
        self.host = host
        self.path = path
        self.method = method
        self.parameters = parameters
        headers.forEach {
            switch $0 {
            case .authorization(let token):
                self.headersDict[HeadersConstant.authorization] = "Bearer \(token)"
            case .contentType:
                self.headersDict[HeadersConstant.contentType] = "application/json"
            }
        }
    }
    
    func asURLRequest() -> URLRequest {
        var components: URLComponents? = .init(string: host)
        components!.path = path
        let url: URL = components!.url!
        var request: URLRequest = .init(url: url)
        request.httpMethod = method.rawValue
        headersDict.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        return request
    }
}

// MARK: - HTTPMethods
extension BaseRequest {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
}

// MARK: - Headers
extension BaseRequest {
    struct HeadersConstant {
        static let authorization: String = "Authorization"
        static let contentType: String = "Content-Type"
    }
    enum Header {
        case authorization(token: String)
        case contentType
    }
}
