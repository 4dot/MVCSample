//
//  MockSchoolSATNetworkManager.swift
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
struct MockSchoolSATNetworkManager: NetworkManager {
    var client: NetworkClient
    var relativePath: String
    
    init(client: NetworkClient) {
        self.client = client
        self.relativePath = "NYCHighSchoolsSAT"    // Schools SAT json file name
    }
    
    /**
     * @desc Request Schools List from local Json file
     */
    func requestSchoolSAT(dbn: String, callback: ((NetworkClientResult<[SchoolSAT]>) -> Void)?) {
        client.request(method: .get, path: path, parameters: nil, httpBody: nil, callback: { (result: NetworkClientResult<[SchoolSAT]>) in
            callback?(result)
        })
    }
}
