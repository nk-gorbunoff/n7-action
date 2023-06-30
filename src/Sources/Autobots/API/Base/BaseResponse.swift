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

final class BaseRequest {
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
         headers: [HeaderType] = []) {
        self.host = host
        self.path = path
        self.method = method
        self.parameters = parameters
        self.setupHeaders(with: headers)
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
    
    private func setupHeaders(with headersEnum: [HeaderType]) {
        headersEnum.forEach {
            switch $0 {
            case .authorization(let token):
                self.headersDict[HeadersConstant.authorization] = "Bearer \(token)"
            case .contentType:
                self.headersDict[HeadersConstant.contentType] = "application/json"
            case .accept:
                self.headersDict[HeadersConstant.accept] = "application/vnd.github+json"
            case .githubAPIVersion:
                self.headersDict[HeadersConstant.githubAPIVersion] = "2022-11-28"
            }
        }
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
        static let accept: String = "Accept"
        static let githubAPIVersion: String = "X-GitHub-Api-Version"
    }
    enum HeaderType {
        case authorization(token: String)
        case contentType
        case accept
        case githubAPIVersion
    }
}
