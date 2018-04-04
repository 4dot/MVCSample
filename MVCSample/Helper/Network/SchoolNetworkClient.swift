//
//  SchoolNetworkClient.swift
//  MVCSample
//
//  Created by chanick park on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation

//
// SchoolNetworkClient
//
class SchoolNetworkClient : NetworkClient {
    var basePath: String {
        return baseUrl.absoluteString
    }
    
    // Base URL
    let baseUrl = URL(string: "https://data.cityofnewyork.us/resource/")!
    private let session: URLSession
    
    /**
     * @desc Init
     * @param URLSession, Set a URLSession.shared
     */
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /**
     * @desc Network Request using parameters
     * @param method, path, parameters
     * @return callback
     */
    func request(method: HttpMethod, path: String, parameters: [String : Any]? = nil, httpBody: Data? = nil, callback: @escaping (NetworkClientResult<Data>) -> Void) {
        
        guard let url = URL(string: path, relativeTo: baseUrl) else {
            return
        }
        do {
            let request = try JSONURLRequestFactory().create(url: url, httpMethod: method, parameters: parameters)
            let task = session.dataTask(with: request) { (data, response, error) in
                let httpResponse = response as! HTTPURLResponse
                
                DispatchQueue.main.async {
                    if let data = data, (200..<300).contains(httpResponse.statusCode) {
                        callback(.success(data))
                    } else if let error = error {
                        callback(.failure([error.localizedDescription]))
                    }
                }
            }
            
            task.resume()
        } catch let error {
            callback(.failure([error.localizedDescription]))
        }
    }
    
    /**
     * @desc Network Request using parameters
     * @return Decode to Specific Result Type
     */
    func request<T>(method: HttpMethod, path: String, parameters: [String : Any]? = nil, httpBody: Data? = nil, callback: @escaping (NetworkClientResult<T>) -> Void) where T : Decodable, T : Encodable {
        
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
