//
//  MockSchoolNetworkManager.swift
//  MVCSampleTests
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import XCTest
@testable import MVCSample



//
// MockSchoolNetworkManager
//
struct MockSchoolNetworkManager: NetworkManager {
    var client: NetworkClient
    var relativePath: String
    
    init(client: NetworkClient) {
        self.client = client
        self.relativePath = "NYCHighSchoolsList"    // Schools List json file name
    }
    
    /**
     * @desc Request Schools List from local Json file
     */
    func requestSchoolsList(callback: ((NetworkClientResult<[School]>) -> Void)?) {
        client.request(method: .get, path: path, parameters: nil, httpBody: nil, callback: { (result: NetworkClientResult<[School]>) in
            callback?(result)
        })
    }
}
