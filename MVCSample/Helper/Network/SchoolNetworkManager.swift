//
//  SchoolNetworkManager.swift
//  20180313-ChanickPark-NYCSchools
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


//
// SchoolNetworkManager
// Request Schools List
//
struct SchoolNetworkManager: NetworkManager {
    let client: NetworkClient
    let relativePath: String
    
    init(client: NetworkClient) {
        self.client = client
        
        // full path : https://data.cityofnewyork.us/resource/97mf-9njv.json
        self.relativePath = "97mf-9njv.json"    // Schools List sub path
    }
    
    /**
     * @desc Request Schools List with parameters (dbn, school_name columns) using SoQL Queries
     */
    func requestSchoolsList(callback: ((NetworkClientResult<[School]>) -> Void)?) {
        
        // SoQL Queries type parameters, request 2 columns information
        let parameters = ["$select" : "dbn, school_name, city"]
        client.request(method: .get, path: path, parameters: parameters, httpBody: nil, callback: { (result: NetworkClientResult<[School]>) in
            callback?(result)
        })
    }
    
}
