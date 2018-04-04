//
//  NetworkManager.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation

//
// NetworkManager protocol
//
protocol NetworkManager {
    var client: NetworkClient { get }
    var relativePath: String { get }
    var path: String { get }
}

extension NetworkManager {
    var path: String {
        return "\(client.basePath)\(relativePath)"
    }
}
