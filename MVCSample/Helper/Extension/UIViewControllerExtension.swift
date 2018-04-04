//
//  UIViewControllerExtension.swift
//  MVCSample
//
//  Created by chanick park on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

//
// Extension UIViewController
//
extension UIViewController {
    /**
     * @desc Show Alert View with title and messages
     */
    func presentAlertController(title: String, errors: [String]) {
        let message = errors.joined(separator: "\n")
        self.present(createAlertController(title: title, message: message), animated: true, completion: nil)
    }
    
    /**
     * @desc query parameters parser
     * @return [URLQueryItem]
     */
    func createAlertController(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        return alertController
    }
}
