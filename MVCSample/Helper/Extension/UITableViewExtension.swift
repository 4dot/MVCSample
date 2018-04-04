//
//  UITableViewExtension.swift
//  MVCSample
//
//  Created by chanick park on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

extension UITableView {
    /**
     * @desc Dequeue Reusable Cell with T, Make sure Cell class name is equal with Storyboard Id
     * @return T
     */
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier)")
        }
        
        return cell
    }
    
}
