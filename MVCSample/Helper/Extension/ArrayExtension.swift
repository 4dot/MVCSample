//
//  ArrayExtension.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


extension Array {
    /**
     * @desc safe accee with index
     * @param index
     * @return Element optional
     */
    subscript (safe index: Index) -> Element? {
        return index < count ? self[index] : nil
    }
}
