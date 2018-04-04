//
//  Dictionary+Extension.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


extension Dictionary {
    /**
     * @desc Update value in Immutable dictionary
     * @param [Key:Value]
     */
    mutating func add(dictionary: [Key: Value]) {
        dictionary.forEach { (key, value) in
            self.updateValue(value, forKey: key)
        }
    }
}
