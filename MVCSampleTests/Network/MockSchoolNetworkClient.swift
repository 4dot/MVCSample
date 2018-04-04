//
//  MockSchoolNetworkClient.swift
//  MVCSampleTests
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import XCTest
@testable import MVCSample


enum BundleRequestError: Error {
    case invalidPath
    case invalidData
}

//
// MockSchoolNetworkClient
// Load from local json file
//
class MockSchoolNetworkClient : NetworkClient {
    var basePath: String = ""
    
    /**
     * @desc Network request using URLSession
     * @param .POST, .GET, params
     * @return callback with Data type
     */
    func request(method: HttpMethod, path: String, parameters: [String : Any]?, httpBody: Data?, callback: @escaping (NetworkClientResult<Data>) -> Void) {
        // load json file from local (data type)
        guard let url = Bundle(for: MVCSampleTests.self).url(forResource: path, withExtension: "json") else {
            callback(.failure([BundleRequestError.invalidPath.localizedDescription]))
            return
        }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            callback(.success(data))
        } catch {
            // handle error
            callback(.failure([BundleRequestError.invalidData.localizedDescription]))
        }
    }
    
    /**
     * @desc Network request
     * @param
     * @return callback with user data type(Decodable)
     */
    func request<T>(method: HttpMethod, path: String, parameters: [String : Any]?, httpBody: Data?, callback: @escaping (NetworkClientResult<T>) -> Void) where T : Decodable, T : Encodable {
        // load json file from local (custom class type)
        request(method: method, path: path, parameters: parameters, httpBody: httpBody) { (dataResult) in
            switch dataResult {
            case .success(let data):
                do {
                    let codable = try JSONDecoder().decode(T.self, from: data)
                    callback(.success(codable))
                } catch let error {
                    callback(.failure([error.localizedDescription]))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
