//
//  School.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

//
// School Model
//
struct School : Codable {
    // Overriding the property names, with custom property names
    // when the json field is different, requires defining a `CodingKeys`
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case school_name = "school_name"
        case city = "city"
        case price
        case color
        case isInStock
        case imageURLs
        case shortDescription
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decode(String.self, forKey: .dbn)
        school_name = try values.decode(String.self, forKey: .school_name)
        city = try values.decode(String.self, forKey: .city)
    }
    
    public init() {
        dbn = ""
        school_name = ""
        city = ""
    }
    
    public func encode(to encoder: Encoder) throws {}
    
    var dbn: String
    var school_name: String
    var city: String
}
