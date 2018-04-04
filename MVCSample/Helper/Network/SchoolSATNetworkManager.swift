//
//  SchoolSATNetworkManager.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation



//
// SchoolSATNetworkManager
// Request School SAT
//
struct SchoolSATNetworkManager: NetworkManager {
    let client: NetworkClient
    let relativePath: String
    
    init(client: NetworkClient) {
        self.client = client
        
        // full path : https://data.cityofnewyork.us/resource/734v-jeq5.json
        self.relativePath = "734v-jeq5.json"    // SchoolSAT sub path
    }
    
    /**
     * @desc Request School SAT with parameters (dbn)
     */
    func requestSchoolSAT(dbn: String, callback: ((NetworkClientResult<[SchoolSAT]>) -> Void)?) {
        // find SAT information with dbn
        let parameters = ["dbn" : dbn]
        client.request(method: .get, path: path, parameters: parameters, httpBody: nil, callback: { (result: NetworkClientResult<[SchoolSAT]>) in
            callback?(result)
        })
    }
}
