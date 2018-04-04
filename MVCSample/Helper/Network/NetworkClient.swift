//
//  NetworkClient.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


//
// Protocol NetworkClient
//
protocol NetworkClient {
    var basePath: String { get }
    func request(method: HttpMethod, path: String, parameters: [String: Any]?, httpBody: Data?, callback: @escaping (NetworkClientResult<Data>) -> Void)
    func request<T: Codable>(method: HttpMethod, path: String, parameters: [String: Any]?, httpBody: Data?, callback: @escaping (NetworkClientResult<T>) -> Void)
}

// Network Client Result
enum NetworkClientResult<Type> {
    case success(Type)
    // array of error messages
    case failure([String])
}
